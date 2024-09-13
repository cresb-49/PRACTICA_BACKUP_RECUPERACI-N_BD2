#!/bin/bash
fecha=$(date +"%Y%m%d_%H%M%S")
mysqldump -u admin_db2 -p'201931012' --databases schema_17_1 schema_17_2 schema_17_3 > BK_Completo_$fecha.sql
