#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de

# This module provides generic service handling for each program supporting
# standard process signals.
# In general you only have to replace the string "generic" to you specific
# application name.

# Dependencies:

# - bash (or any bash like shell)
# - date - Print or set the system date and time.
# - find - Search for files in a directory hierarchy.
# - test - Check file types and compare values.
# - msmtp - An SMTP client.

# You have to install program "msmtp" to get this script working. A proper user
# specific "~/.msmtprc" or global "/etc/msmtprc" have to be present on wating
# distribution. A sample configuration using simple gmail account to send
# mails (Replace "ACCOUNT_NAME", "ACCOUNT_E_MAIL_ADDRESS",
# "ACCOUNT_PASSWORD", "RECIPIENT_E_MAIL_ADDRESS", "URL1" and remove or edit
# "URL2", "NODE_NAME" and "ANOTHER_RECIPIENT_E_MAIL_ADDRESS"):

# defaults
# auth           on
# tls            on
# tls_starttls   on
# tls_trust_file /etc/ssl/certs/ca-certificates.crt
# logfile        /tmp/msmtpLog

# account        gmail
# host           smtp.gmail.com
# port           587
# from           ACCOUNT_E_MAIL_ADDRESS
# user           ACCOUNT_NAME@gmail.com
# password       ACCOUNT_PASSWORD

# account        default : gmail
# endregion
# region default options
# Example:
# declare -A source_target_mappings=(
#     ['SOURCE_URL1']='TARGET_URL1 RECIPIENT_E_MAIL_ADDRESS' \
#     ['SOURCE_URL2']='TARGET_URL2 RECIPIENT_E_MAIL_ADDRESS ANOTHER_RECIPIENT_E_MAIL_ADDRESS')
declare -A source_target_mappings=()
sender_e_mail_address='' # Disables by default
replier_e_mail_address="$sender_e_mail_address"
daily_target_path='daily/'
weekly_target_path='weekly/'
monthly_target_path='monthly/'
target_daily_file_name="$(date +'%d-%m-%Y')"
target_weekly_file_name="$(date +'%V.week-')${target_daily_file_name}"
target_monthly_file_name="$target_daily_file_name"
# Should be in range 1 till 28
backup_month_day_number=1
# Should be in range 1 till 7
backup_week_day_number=6 # Saturday
number_of_daily_retention_days=14 # Daily backups for the last 14 days.
number_of_weekly_retention_days=56 # Weekly backups for the last 2 month.
number_of_monthly_retention_days=365 # Monthly backups for the last year.
target_file_extension='.tar.gz'
backup_command='rsync --recursive --delete --perms --executability --owner --group --times --devices --specials --acls --links --super --whole-file --force --protect-args --hard-links --max-delete=1 --progress --human-readable --itemize-changes --verbose --exclude=.git --exclude=.npm --exclude=node_modules --exclude=.local "$source_path" "$target_file_path" && tar --create --verbose --gzip --file "${target_file_path}${target_file_extension}" "$target_file_path" && rm --recursive --verbose "$target_file_path"'
# Folder to delete is the last command line argument.
cleanup_command='rm --recursive --verbose'
verbose=false
name='NODE_NAME'
# endregion
# region load options if present
if [ -f /etc/backupRotation ]; then
    source /etc/backupRotation
fi
# endregion
# region controller
# Get current month and week day number
month_day_number="$(date +'%d' | grep '[1-9][0-9]?' --only-matching \
    --extended-regexp)"
week_day_number="$(date +'%u')"
for source_path in "${!source_target_mappings[@]}"; do
    target_path="$(echo "${source_target_mappings[$source_path]}" | \
        grep '^[^ ]+' --only-matching --extended-regexp)"
    target_file_path="${target_path}/${daily_target_path}${target_daily_file_name}"
    if [[ "$month_day_number" == "$backup_month_day_number" ]]; then
        target_file_path="${target_path}/${monthly_target_path}${target_monthly_file_name}"
        ln --symbolic --force "${target_file_path}${target_file_extension}" \
            "${target_path}/${daily_target_path}${target_daily_file_name}${target_file_extension}"
        if [[ "$week_day_number" == "$backup_week_day_number" ]]; then
            ln --symbolic --force "${target_file_path}${target_file_extension}" \
                "${target_path}/${weekly_target_path}${target_weekly_file_name}${target_file_extension}"
        fi
    elif [[ "$week_day_number" == "$backup_week_day_number" ]]; then
        target_file_path="${target_path}/${weekly_target_path}${target_weekly_file_name}"
        ln --symbolic --force "${target_file_path}${target_file_extension}" \
            "${target_path}/${daily_target_path}${target_daily_file_name}${target_file_extension}"
    fi
    mkdir --parents "$(dirname "$target_file_path")"
    if $verbose; then
        echo "Running \"${backup_command}\"."
    else
        backup_command+="${backup_command} &>/dev/null"
    fi
    if eval "$backup_command"; then
        # Clean outdated daily backups.
        find "${target_path}/${daily_target_path}" -mtime \
            +"$number_of_daily_retention_days" -exec $cleanup_command {} \;
        # Clean outdated weekly backups.
        find "${target_path}/${weekly_target_path}" -mtime \
            +"$number_of_weekly_retention_days" -exec $cleanup_command {} \;
        # Clean outdated monthly backups.
        find "${target_path}/${monthly_target_path}" -mtime \
            +"$number_of_monthly_retention_days" -exec $cleanup_command {} \;
    else
        message="Source files in \"$source_path\" should be backed up but aren't available."
        $verbose && echo "$message" &>/dev/stderr
        if hash msmtp && [[ "$sender_e_mail_address" != '' ]]; then
            for e_mail_address in \
                $(echo "${source_target_mappings[$source_path]}" | \
                grep ' .+$' --only-matching --extended-regexp)
            do
                msmtp -t <<EOF
From: $sender_e_mail_address
To: $e_mail_address
Reply-To: $replier_e_mail_address
Date: $(date)
Subject: Source files doesn't exist.

$message

EOF
            done
        fi
        exit 1
    fi
done
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
