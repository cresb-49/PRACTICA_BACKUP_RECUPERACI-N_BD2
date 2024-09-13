#!/bin/bash

# Verificar si se proporcionó la ruta del archivo de backup a restaurar
if [ -z "$1" ]; then
  echo "Por favor proporciona la ruta al archivo de backup para restaurar."
  exit 1
fi

backup_file=$1

# Verificar si el archivo proporcionado existe
if [ ! -f "$backup_file" ]; then
  echo "El archivo de backup $backup_file no existe."
  exit 1
fi

# Detectar si se está utilizando MySQL o MariaDB
if systemctl is-active --quiet mysql; then
  db_service="mysql.service"
  db_base_path="/var/lib/mysql"
elif systemctl is-active --quiet mariadb; then
  db_service="mariadb.service"
  db_base_path="/var/lib/mysql"
else
  echo "No se detectó un servicio activo de MySQL o MariaDB."
  exit 1
fi

echo "Detectado $db_service. Restaurando los esquemas desde el backup..."

# Lista de esquemas respaldados
esquemas=("schema_17_1" "schema_17_2" "schema_17_3")

# Parar el servicio MySQL o MariaDB antes de la restauración
echo "Deteniendo el servicio $db_service para realizar la restauración..."
sudo systemctl stop $db_service

# Extraer el backup en la ubicación adecuada
echo "Extrayendo el backup $backup_file en $db_base_path..."
tar -xzvf $backup_file -C $db_base_path

# Verificar si las carpetas de los esquemas se restauraron correctamente
for esquema in "${esquemas[@]}"
do
  esquema_path="$db_base_path/$esquema"
  
  if [ -d "$esquema_path" ]; then
    echo "El esquema $esquema fue restaurado correctamente en $esquema_path."
  else
    echo "Advertencia: El esquema $esquema no se restauró correctamente."
  fi
done

# Iniciar nuevamente el servicio MySQL o MariaDB
echo "Iniciando el servicio $db_service nuevamente..."
sudo systemctl start $db_service

echo "Restauración completada."
