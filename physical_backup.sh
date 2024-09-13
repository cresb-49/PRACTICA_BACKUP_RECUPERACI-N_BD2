#!/bin/bash

# Verificar si se proporcionó una ruta para almacenar el backup
if [ -z "$1" ]; then
  echo "Por favor proporciona la ruta donde se almacenará el backup."
  exit 1
fi

# Definir la ruta del backup
fecha=$(date +"%Y%m%d_%H%M%S")
backup_dir=$1
backup_file="$backup_dir/BK_Fisico_$fecha.tar.gz"

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

echo "Detectado $db_service. Realizando backup físico de los esquemas en un solo archivo..."
# Parar el servicio MySQL o MariaDB antes del backup
echo "Deteniendo el servicio $db_service para realizar el backup..."
sudo systemctl stop $db_service

# Lista de esquemas a respaldar
esquemas=("schema_17_1" "schema_17_2" "schema_17_3")

# Verificar si los esquemas existen antes de proceder
esquemas_existentes=()
for esquema in "${esquemas[@]}"
do
  esquema_path="$db_base_path/$esquema"
  
  if [ -d "$esquema_path" ]; then
    esquemas_existentes+=("$esquema")
  else
    echo "Advertencia: No se encontró el esquema $esquema en $db_base_path."
  fi
done

# Crear el backup si se encontraron esquemas válidos
if [ ${#esquemas_existentes[@]} -gt 0 ]; then
  tar -czvf $backup_file -C $db_base_path "${esquemas_existentes[@]}"
  echo "Backup físico completado en: $backup_file"
else
  echo "No se encontraron esquemas válidos para respaldar."
fi

# Iniciar nuevamente el servicio MySQL o MariaDB
echo "Iniciando el servicio $db_service nuevamente..."
sudo systemctl start $db_service
sudo systemctl status $db_service
