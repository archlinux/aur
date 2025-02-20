function wpm() {
    if [[ "$1" == "go" && $# -eq 2 ]]; then
        local dir=$(/usr/local/bin/wpm go "$2")
        if [[ -d "$dir" ]]; then
            cd "$dir" || return
            echo "Moved to $dir"
        else
            echo "Directory not found: $dir"
        fi
    else
        /usr/local/bin/wpm "$@"
    fi
}
