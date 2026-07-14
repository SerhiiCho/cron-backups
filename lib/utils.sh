LOG_FILE="logs/$(date '+%Y-%m-%d.log')"
SHOW_LOG=1

if [[ "$1" == "--silent" ]]; then
    SHOW_LOG=0
fi

log() {
    local level="${2:-INFO}"
    level="${level^^}"
    local emo="ℹ️"

    if [[ "$level" == "ERROR" ]]; then
        emo="❌"
    fi

    output="[$(date +'%Y-%m-%d %H:%M:%S')] [$level] $emo  $1"

    if [[ "$SHOW_LOG" -eq 1 ]]; then
        echo "$output"
    else
        echo "$output" >> "$LOG_FILE"
    fi
}

is_number() {
    if [[ "$1" =~ ^-?[0-9]+$ ]]; then
        return 1
    fi
    return 0
}
