#!/bin/bash
yaylog() {
    local count=20
    local explicit_only=false
    local all_packages=false

    while getopts "n:ea" opt; do
        case "$opt" in
            n) count="$OPTARG" ;;
            e) explicit_only=true ;;
            a) all_packages=true ;;
            *) 
                echo "Usage: yaylog [-n <number>] [-e] [-a]"
                return 1
                ;;
        esac
    done
    shift $((OPTIND - 1))

    local cmd="expac --timefmt='%Y-%m-%d %T' '%l\t%n\t%w'"

    if "$explicit_only"; then
        cmd+=" | awk -F '\t' '\$3 == \"explicit\"'"
    fi

    if "$all_packages"; then
        count=0
    fi

    cmd+=" | sort"
    if [ "$count" -gt 0 ]; then
        cmd+=" | tail -n $count"
    fi

    cmd+=" | column -t -s $'\t'"

    eval "$cmd"
}
yaylog "$@"
EOF

