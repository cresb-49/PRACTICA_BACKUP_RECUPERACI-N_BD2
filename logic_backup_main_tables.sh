#!/bin/bash
fecha=$(date +"%Y%m%d_%H%M%S")
mysqldump -u root -p schema_17_1 tabla1_17_1 tabla2_17_1 tabla3_17_1 \
  schema_17_2 tabla1_17_2 tabla2_17_2 tabla3_17_2 \
  schema_17_3 tabla1_17_3 tabla2_17_3 tabla3_17_3 > BK_Principal_$fecha.sql
