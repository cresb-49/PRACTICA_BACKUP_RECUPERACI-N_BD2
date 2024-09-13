# Práctica de Backup y Recuperación de Bases de Datos MySQL

Este proyecto tiene como objetivo la implementación de scripts para la realización de backups lógicos y físicos de bases de datos MySQL, así como su restauración. También incluye la configuración de backups automáticos mediante cron jobs y permite la gestión segura de las bases de datos `schema_17_1`, `schema_17_2` y `schema_17_3`.

## Estructura del Proyecto

El proyecto incluye scripts para las siguientes funcionalidades:

### Archivos Principales

- **DDL.sql**: Contiene las instrucciones de creación de la estructura de las bases de datos (schemas y tablas).
- **DML_schema_17_1.sql**, **DML_schema_17_2.sql**, **DML_schema_17_3.sql**: Archivos con los comandos `INSERT` para poblar las bases de datos `schema_17_1`, `schema_17_2`, y `schema_17_3` respectivamente con datos de ejemplo.
- **logic_backup_all_db.sh**: Script para realizar un backup lógico completo de todas las bases de datos (incluyendo tanto la estructura como los datos).
- **logic_backup_main_data.sh**: Script para realizar un backup lógico que incluye solo los datos principales de las bases de datos.
- **logic_backup_main_tables.sh**: Script para realizar un backup lógico que incluye solo las tablas principales, sin los datos.
- **physical_backup.sh**: Script para realizar un backup físico completo de las bases de datos.
- **restore_backup_schemas.sh**: Script para restaurar los backups físicos.

### Scripts de Backup

#### Backup Lógico Completo
Este script crea un backup lógico de todas las bases de datos (esquemas, tablas y datos):

```bash
./logic_backup_all_db.sh
```

#### Backup Solo de Datos Principales
Este script realiza un backup lógico de los datos principales de las bases de datos:

```bash
./logic_backup_main_data.sh
```

#### Backup de Tablas Principales
Este script realiza un backup lógico de las tablas principales sin los datos:

```bash
./logic_backup_main_tables.sh
```

#### Backup Físico Completo
Este script realiza un backup físico completo de las bases de datos en la ruta especificada. Asegúrate de ejecutarlo con permisos de superusuario:

```bash
sudo ./physical_backup.sh /ruta/donde/guardar/el/backup
```

### Script de Restauración

El script `restore_backup_schemas.sh` restaura los esquemas y datos desde un archivo de backup físico `.tar.gz`. Asegúrate de tener permisos de superusuario para ejecutar este script:

```bash
sudo ./restore_backup_schemas.sh /ruta/al/backup/BK_Fisico_TodosEsquemas_YYYYMMDD_HHMMSS.tar.gz
```

## Configuración de Cron Jobs

Puedes automatizar los backups utilizando cron jobs. Los scripts están preparados para realizar diferentes tipos de backups en intervalos específicos. Para configurarlos, puedes editar el cron ejecutando `crontab -e` y añadiendo las siguientes líneas:

```bash
# Backup de tablas principales cada día a las 3am y 3pm
0 3,15 * * * /ruta/al/script/logic_backup_main_tables.sh

# Backup de datos principales cada viernes
0 0 * * 5 /ruta/al/script/logic_backup_main_data.sh

# Backup completo el último día de cada mes
0 0 28-31 * * [ "$(date +\%d -d tomorrow)" = "01" ] && /ruta/al/script/logic_backup_all_db.sh
```

## Requisitos Previos

- **MySQL** o **MariaDB** instalado en el servidor.
- Acceso al usuario `root` o un usuario con permisos adecuados para realizar operaciones de backup y restauración.
- **Bash** para ejecutar los scripts.

## Uso de los Scripts

1. **Clonar el repositorio**:

   Clona este repositorio en tu máquina local o servidor:

   ```bash
   git clone https://github.com/cresb-49/PRACTICA_BACKUP_RECUPERACI-N_BD2.git
   cd PRACTICA_BACKUP_RECUPERACI-N_BD2
   ```

2. **Configurar las bases de datos**:

   Ejecuta el archivo `DDL.sql` para crear las estructuras de las bases de datos:

   ```bash
   mysql -u root -p < DDL.sql
   ```

   Luego, ejecuta los archivos `DML` para poblar las tablas:

   ```bash
   mysql -u root -p schema_17_1 < DML_schema_17_1.sql
   mysql -u root -p schema_17_2 < DML_schema_17_2.sql
   mysql -u root -p schema_17_3 < DML_schema_17_3.sql
   ```

3. **Realizar backups**:

   Ejecuta cualquiera de los scripts de backup proporcionados según la necesidad de tu proyecto.

4. **Restaurar los backups**:

   Para restaurar los esquemas respaldados desde un archivo `.tar.gz`, utiliza el script de restauración:

   ```bash
   sudo ./restore_backup_schemas.sh /ruta/al/backup/BK_Fisico_TodosEsquemas_YYYYMMDD_HHMMSS.tar.gz
   ```

## Notas de Seguridad

- **Contraseñas en los scripts**: Si los scripts incluyen la contraseña de MySQL, asegúrate de que el archivo tenga permisos de lectura restringidos para evitar la exposición de las credenciales:

  ```bash
  chmod 600 nombre_del_script.sh
  ```

- **Backups físicos**: Cuando realices backups físicos, asegúrate de que los archivos estén protegidos adecuadamente y que el servidor MySQL o MariaDB esté detenido para evitar inconsistencias en los datos.

## Contacto

Para más información o en caso de problemas, puedes abrir una issue en el [repositorio](https://github.com/cresb-49/PRACTICA_BACKUP_RECUPERACI-N_BD2/issues).
