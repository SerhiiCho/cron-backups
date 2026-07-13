LOG_FILE="logs/$(date '+%Y-%m-%d.log')"

log() {
    local level="${2:-INFO}"
    level="${level^^}"
    local emo="ℹ️"

    if [[ "$level" == "ERROR" ]]; then
        emo="❌"
    fi

    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [$level] $emo $1" >> "$LOG_FILE"
}

is_number() {
    if [[ "$1" =~ ^-?[0-9]+$ ]]; then
        return 1
    fi
    return 0
}
