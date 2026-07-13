is_number() {
    if [[ "$1" =~ ^-?[0-9]+$ ]]; then
        return 1
    fi
    return 0
}
