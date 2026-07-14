create_missing_env_file() {
    if [[ -f .env ]]; then
        return
    fi

    local answer
    read -rp "❓ You need .env file to run this script. Do you want to create it? Y/n" answer

    if [[ "${answer,,}" == "n" ]]; then
        exit 1
    fi

    cp .env.example .env
    log "🐧 .env file is created. Fill the values"

    exit 1
}

validate_env_values() {
    if [[ "$SQL_BACKUPS_FROM_PATH" == "" ]]; then
        log "SQL_BACKUPS_FROM_PATH env variable should not be empty" "error"
        exit 1
    fi

    if [[ "$STORAGE_BACKUPS_FROM_PATH" == "" ]]; then
        log "STORAGE_BACKUPS_FROM_PATH env variable should not be empty" "error"
        exit 1
    fi

    if [[ "$REMOTE_VPS_HOST" == "" ]]; then
        log "REMOTE_VPS_HOST env variable should not be empty" "error"
        exit 1
    fi

    if [[ "$LOG_RETENTION_DAYS" == "" ]]; then
        log "LOG_RETENTION_DAYS env variable should not be empty" "error"
        exit 1
    fi

    if [[ $(is_number "$LOG_RETENTION_DAYS") == 0 ]]; then
        log "LOG_RETENTION_DAYS env variable should be a number" "error"
        exit 1
    fi

    if [[ "$LOG_RETENTION_DAYS" == "" ]]; then
        log "LOG_RETENTION_DAYS env variable should not be empty" "error"
        exit 1
    fi

    if [[ $(is_number "$BACKUPS_RETENTION_DAYS") == 0 ]]; then
        log "BACKUPS_RETENTION_DAYS env variable should be a number" "error"
        exit 1
    fi

    echo "here"
}
