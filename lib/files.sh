log_file="logs/$(date '+%Y-%m-%d.log')"

copy_files_from_remote() (
    echo "🐧 Copying SQL backups..."
    rsync -avz --timeout=30 "$REMOTE_VPS_HOST":"$SQL_BACKUPS_FROM_PATH" \
        backups >> "$log_file" 2>&1

    echo "🐧 Copying storage files..."
    rsync -avz --timeout=30 "$REMOTE_VPS_HOST":"$STORAGE_BACKUPS_FROM_PATH" \
        storage >> "$log_file" 2>&1
)

cleanup_old_local_files() (
    printf "🐧 Deleting log files older than %d days\n" "$LOG_RETENTION_DAYS"
    find logs \
        -type f \
        -mtime +"$LOG_RETENTION_DAYS" ! \
        -name '.gitignore' \
        -exec rm -f {} +

    printf "🐧 Deleting backup files older than %d days\n" "$BACKUPS_RETENTION_DAYS"
    find logs \
        -type f \
        -mtime +"$BACKUPS_RETENTION_DAYS" ! \
        -name '.gitignore' \
        -exec rm -f {} +
)
