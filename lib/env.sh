create_missing_env_file() {
    if [[ -f .env ]]; then
        return
    fi

    local answer
    read -r "❓ You need .env file to run this script. Do you want to create it? Y/n" answer

    if [[ "${answer,,}" == "n" ]]; then
        exit 1
    fi

    cp .env.example .env
    log "🐧 .env file is created. Fill the values"

    exit 1
}

validate_env_values() {
    echo "here"
}
