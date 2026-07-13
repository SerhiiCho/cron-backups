create_env_file() (
    if [[ -f .env ]]; then
        return
    fi

    read -r "❓ You need .env file to run this script. Do you want to create it? Y/n" answer

    if [[ "${answer,,}" == "n" ]]; then
        exit 1
    fi

    cp .env.example .env
    echo "🐧 .env file is created, fill in the variables values"

    exit 1
)

copy_files() (
    log_file="$(date '+%Y-%m-%d.log')"

    echo "🐧 Copying SQL backups..."
    rsync -avz --timeout=30 "$REMOTE_VPS_HOST":"$SQL_BACKUPS_FROM_PATH" \
        backups >> logs/"$log_file" 2>&1

    echo "🐧 Copying storage files..."
    rsync -avz --timeout=30 "$REMOTE_VPS_HOST":"$STORAGE_BACKUPS_FROM_PATH" \
        storage >> logs/"$log_file" 2>&1
)

delete_old_files() (
    echo "🐧 Old files are deleted"
)
