#!/bin/bash

# PostgreSQL connection parameters
DB_HOST="your_db_host"
DB_PORT="your_db_port"
DB_NAME="your_db_name"
DB_USER="your_db_user"
DB_PASSWORD="your_db_password"

# Backup directory
BACKUP_DIR="/path/to/backup/directory"

# Date format for backup directory
DATE_FORMAT=$(date +"%Y%m%d%H%M%S")

# Log directory and file
LOG_DIR="/etc/logs/backups"
LOG_FILE="$LOG_DIR/backup.log"

# Create the log directory if it doesn't exist
mkdir -p "$LOG_DIR"

# Set the PGPASSWORD environment variable
export PGPASSWORD="$DB_PASSWORD"

# Perform the backup
echo "Starting PostgreSQL backup at $(date)" >> "$LOG_FILE"

# Create a backup directory
mkdir -p "$BACKUP_DIR/$DATE_FORMAT"

# Run pg_basebackup to create a physical backup
pg_dump -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -F p -f "$BACKUP_DIR/$D>

if [ $? -eq 0 ]; then
  echo "Backup completed successfully" >> "$LOG_FILE"
else
  echo "Backup failed" >> "$LOG_FILE"
fi

# Unset the PGPASSWORD variable
unset PGPASSWORD

echo "----------------------------------------" >> "$LOG_FILE"