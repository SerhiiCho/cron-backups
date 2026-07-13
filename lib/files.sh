copy_files_from_remote() {
    log "Copying SQL backups..."
    rsync -avz --timeout=30 "$REMOTE_VPS_HOST":"$SQL_BACKUPS_FROM_PATH" \
        backups >> "$LOG_FILE" 2>&1

    log "Copying storage files..."
    rsync -avz --timeout=30 "$REMOTE_VPS_HOST":"$STORAGE_BACKUPS_FROM_PATH" \
        storage >> "$LOG_FILE" 2>&1
}

cleanup_old_local_files() {
    log "Deleting log files older than $LOG_RETENTION_DAYS days..."
    find logs \
        -type f \
        -mtime +"$LOG_RETENTION_DAYS" ! \
        -name '.gitignore' \
        -exec rm -f {} +

    log "Deleting backup files older than $BACKUPS_RETENTION_DAYS days..."
    find logs \
        -type f \
        -mtime +"$BACKUPS_RETENTION_DAYS" ! \
        -name '.gitignore' \
        -exec rm -f {} +
}
