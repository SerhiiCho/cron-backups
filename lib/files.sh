copy_files_from_remote() (
    log_file="$(date '+%Y-%m-%d.log')"

    echo "🐧 Copying SQL backups..."
    rsync -avz --timeout=30 "$REMOTE_VPS_HOST":"$SQL_BACKUPS_FROM_PATH" \
        backups >> logs/"$log_file" 2>&1

    echo "🐧 Copying storage files..."
    rsync -avz --timeout=30 "$REMOTE_VPS_HOST":"$STORAGE_BACKUPS_FROM_PATH" \
        storage >> logs/"$log_file" 2>&1
)

cleanup_old_local_files() (
    echo "🐧 Old files are deleted"
)
