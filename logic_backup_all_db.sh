#!/bin/bash
fecha=$(date +"%Y%m%d_%H%M%S")
mysqldump -u root -p --databases schema_17_1 schema_17_2 schema_17_3 > BK_Completo_$fecha.sql
