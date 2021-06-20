#!/bin/sh

# clean files older than how many days:
trash_older_than=30
purge_older_than=90

# where to put old tmp files:
tmp=/tmp
trash=/tmp/OLD_TMP_FILES
log=/var/log/tmpcleaner.log

# add typical bin dirs to PATH
export PATH="${PATH}:/usr/bin:/usr/local/bin"

# run with root priviliges
if [ "$1" != -s ]; then
    sudo tmpcleaner -s
    exit
fi

main() {
    mkdir -p "$trash" || exit 1
    before=$(numberof_files_in_trash)
    move_old_tmpfiles_to_trash
    after_trashing=$(numberof_files_in_trash)
    purge_older_tmpfiles_from_trash
    after_purging=$(numberof_files_in_trash)
    trashed_count=$(( after_trashing - before ))
    purged_count=$(( after_trashing - after_purging ))
    print_date >> "$log"
    print_summary "$trashed_count" "$purged_count" | tee -a "$log"
    echo >> "$log"
}

move_old_tmpfiles_to_trash() {
    find "$tmp" -type f -not -path "${trash}*" -mtime +${trash_older_than} \
        -exec mv -f {} "$trash" \;
}

purge_older_tmpfiles_from_trash() {
    find "$trash" -type f -mtime +${purge_older_than} -delete
}

numberof_files_in_trash() {
    find "$trash" -mindepth 1 -maxdepth 1 | wc -l
}

print_summary() {
    echo "moved $1 tmpfiles to trash (${trash})."
    echo "purged $2 tmpfiles from trash."
}

print_date() {
    date "+%F %T :"
}

main "$@"
exit
