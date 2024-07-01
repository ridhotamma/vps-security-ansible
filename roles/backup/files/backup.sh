#!/bin/bash

# Define backup directory
BACKUP_DIR="/var/backups"
MYSQL_BACKUP_DIR="$BACKUP_DIR/mysql"
POSTGRES_BACKUP_DIR="$BACKUP_DIR/postgres"

# Create backup directories if they don't exist
mkdir -p "$MYSQL_BACKUP_DIR"
mkdir -p "$POSTGRES_BACKUP_DIR"

# MySQL Backup
MYSQL_USER="your_mysql_user"
MYSQL_PASSWORD="your_mysql_password"
MYSQL_DATABASE="your_mysql_database"

mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" > "$MYSQL_BACKUP_DIR/${MYSQL_DATABASE}_$(date +\%F).sql"

# PostgreSQL Backup
POSTGRES_USER="your_postgres_user"
POSTGRES_DATABASE="your_postgres_database"

export PGPASSWORD="your_postgres_password"
pg_dump -U "$POSTGRES_USER" "$POSTGRES_DATABASE" > "$POSTGRES_BACKUP_DIR/${POSTGRES_DATABASE}_$(date +\%F).sql"
unset PGPASSWORD

# Remove backups older than 7 days
find "$BACKUP_DIR" -type f -name "*.sql" -mtime +7 -exec rm {} \;
