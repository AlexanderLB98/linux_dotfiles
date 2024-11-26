#!/bin/bash

# Archivo de log donde se guardará la salida
LOG_FILE="/home/lucas/.logs/test_cron.log"

# Escribe la fecha y hora en el archivo de log
echo "Cron ejecutado en: $(date)" >> $LOG_FILE

