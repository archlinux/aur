#!/bin/sh
# author: Ehsan Ghorbannezhad <ehsangn@protonmail.ch>
# brief: remove/trash old files/directories from /tmp.
#
# this script removes/trashes top-level files in /tmp that are
# older than the specified amount of time.
# it also removes top-level directories in /tmp that
# are older than the specified amount of time, and don't
# contain any files newer than that time.
#
# the -l option instructs tmpcleaner to
# log the summary to a log file.

# config path
conf=/etc/tmpcleaner/config

# add typical bin dirs to PATH
export PATH="${PATH}:/usr/bin:/usr/local/bin"

# run with root priviliges
if [ "$1" != -s ]; then
    sudo "$0" -s "$@"
    exit
else
    shift
fi


main()
{
    handle_conf
    . "$conf"

    while true; do
        case "$1" in
            -l) log=true; shift ;;
            -h | --help) print_help; exit ;;
            "") break ;;
            *) die unrecognized argument: "$1" ;;
        esac
    done

    printf '%s\n' "$dir_list" | awk NF | while IFS= read -r dir; do
        cleanup "$dir"
    done
}

cleanup()
{
    tmp_dir="$1"
    trash_dir="$1/$trash_dir_name"

    [ -e "$tmp_dir" ] || {
        warn "directory $tmp_dir doesn't exist."
        return 1
    }

    mkdir -p "$trash_dir" || {
        warn "couldn't make directory $trash_dir"
        return 1
    }

    must_trash="$(getold "$tmp_dir" "$trash_older_than" "$trash_dir")"
    must_purge="$(getold "$trash_dir" "$purge_older_than")"

    printf '%s\n' "$must_trash" | trash
    printf '%s\n' "$must_purge" | purge

    summary "$tmp_dir" "$trash_dir" "$must_trash" "$must_purge"
}

getold()
{
    find "$1" -mindepth 1 -maxdepth 1 -type f -mtime +"$2"
    find "$1" -mindepth 1 -maxdepth 1 -type d -mtime +"$2" ${3:+-not -path "*${3}*"} |
        while IFS= read -r dir; do
            test "$(find "$dir" -type f -mtime -"$2" -quit)" || printf '%s\n' "$dir"
        done
}

trash()
{
    while IFS= read -r file; do
        [ -e "$file" ] || continue
        touch "$file"
        mv -fv "$file" "$trash_dir"
    done
}

purge()
{
    while IFS= read -r file; do
        [ -e "$file" ] && rm -rfv "$file"
    done
}

warn()
{
    msg "warning: $*"
}

msg()
{
    msg="tmpcleaner: $*"
    printf '%s\n' "$msg" >&2
    [ "$log" != true ] && return 0
    printf '%s %s\n' "$(date '+%F %T')" "$msg" >> "$log_file"
}

summary()
{
    msg1="tmpcleaner: \"$1\": moved $(line_count "$3") files to trash ($2)."
    msg2="tmpcleaner: \"$1\": purged $(line_count "$4") files from trash."
    printf '%s\n%s\n' "$msg1" "$msg2" >&2
    [ "$log" != true ] && return 0
    printf '%s %s %s\n' "$(date '+%F %T')" "$msg1" "$msg2" >> "$log_file"
}

handle_conf()
{
    if [ ! -r "$conf" ]; then
        mkdir -p "$(dirname "$conf")" || die could not make parent directory of "$conf"
        print_default_conf > "$conf" || die could not write to "$conf"
    fi
}

print_help()
{
    echo "remove old files and directories from /tmp and other places."
    echo "configuration is in /etc/tmpcleaner/conifg."
}

print_default_conf()
{
cat << 'eof'
# clean files older than how many days:
trash_older_than=30
purge_older_than=7

# list of dirs to operate on (one per line)
dir_list='
/tmp
'
# other settings
trash_dir_name=OLD_FILES
log_file=/var/log/tmpcleaner.log
eof
}

die()
{
    echo 'tmpcleaner error:' "$@" >&2
    exit 1
}

line_count()
{
    [ -z "$1" ] && echo 0 && return
    echo "$1" | wc -l
}

main "$@"
exit
