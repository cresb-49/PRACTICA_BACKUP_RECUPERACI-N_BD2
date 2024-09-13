#!/bin/bash
if [ -z "$1" ]; then
  echo "Por favor proporciona la ruta donde se almacenará el backup."
  exit 1
fi

fecha=$(date +"%Y%m%d_%H%M%S")
backup_dir=$1
backup_file="$backup_dir/BK_Fisico_$fecha.tar.gz"

# Backup físico
tar -czvf $backup_file /var/lib/mysql
