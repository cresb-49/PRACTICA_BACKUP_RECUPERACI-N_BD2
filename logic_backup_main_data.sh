#!/bin/bash
fecha=$(date +"%Y%m%d_%H%M%S")

# Backup de las tablas del esquema 1
echo "USE schema_17_1;" > BK_SoloDatos_$fecha.sql
mysqldump -u root -p --no-create-info schema_17_1 tabla1_17_1 tabla2_17_1 tabla3_17_1 >> BK_SoloDatos_$fecha.sql

# Backup de las tablas del esquema 2
echo "USE schema_17_2;" >> BK_SoloDatos_$fecha.sql
mysqldump -u root -p --no-create-info schema_17_2 empleados_17_2 proyectos_17_2 ventas_17_2 >> BK_SoloDatos_$fecha.sql

# Backup de las tablas del esquema 3
echo "USE schema_17_3;" >> BK_SoloDatos_$fecha.sql
mysqldump -u root -p --no-create-info schema_17_3 clientes_17_3 facturas_17_3 pagos_17_3 >> BK_SoloDatos_$fecha.sql
