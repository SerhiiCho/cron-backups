create_env_file_if_missing() (
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

exit_if_env_vars_are_empty() (
    echo "here"
)

