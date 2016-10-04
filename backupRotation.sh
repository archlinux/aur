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
sourcePath='/tmp/source/'
targetPath='/tmp/backup/'
eMailAddress='' # Notification are disabled by default.
dailyTargetPath='daily/'
weeklyTargetPath='weekly/'
monthlyTargetPath='monthly/'
targetDailyFileName="$(date +'%d-%m-%Y')"
targetWeeklyFileName="$(date +'%V sav. %m-%Y')"
targetMonthlyFileName="$(date +'%m-%Y')"
backupWeekDayNumber=6 # Saturday
backupMonthDayNumber=1
numberOfDailyRetentionDays=14 # Daily backups for the last 14 days.
numberOfWeeklyRetentionDays=56 # Weekly backups for the last 2 month.
numberOfMonthlyRetentionDays=365 # Monthly backups for the last year.
backupCommand='rsync --recursive --delete --perms --executability --owner --group --times --devices --specials --acls --links --super --whole-file --force --protect-args --hard-links --max-delete=1 --progress --human-readable --itemize-changes --verbose "$sourcePath" "$targetFilePath" && tar --dereference --create --verbose --gzip --file "${targetFilePath}.tar.gz" "$targetFilePath" && rm --recursive --verbose "$targetFilePath"'
# Folder to delete is the last command line argument.
cleanupCommand='rm --recursive --verbose'
# endregion
# region load options if present
if [ -f /etc/backupRotation ]; then
    source /etc/backupRotation
fi
# endregion
# region controller
# Get current month and week day number
monthDayNumber="$(date +'%d')"
weekDayNumber="$(date +'%u')"
# Check if source files exist and send an email if not
if [ ! -d "$sourcePath" ]; then
    date="$(date)"
    message="Source files on \"$sourcePath\" should be backed up but aren't available."
    if hash msmtp && [[ "$eMailAddress" != '' ]]; then
        msmtp -t <<EOF
From: $eMailAddress
To: $eMailAddress
Reply-To: $eMailAddress
Date: $date
Subject: Source files doesn't exist.

$message

EOF
    fi
    echo "$message" &>/dev/stderr
    return 1
fi
if [[ "$monthDayNumber" == "$backupMonthDayNumber" ]]; then
    targetFilePath="${targetPath}${dailyTargetPath}${targetDailyFileName}"
elif [[ "$weekDayNumber" == "$backupMontheDayNumber" ]]; then
    targetFilePath="${targetPath}${dailyTargetPath}${targetDailyFileName}"
else
    targetFilePath="${targetPath}${dailyTargetPath}${targetDailyFileName}"
fi
mkdir --parents "$(dirname "$targetFilePath")"
eval "$backupCommand"
# Clean outdated daily backups.
find "$targetPath" -mtime +"$numberOfDailyRetentionDays" -type d -exec \
    "$cleanupCommand" {} \;
# Clean outdated weekly backups.
find "$targetPath" -mtime +"$numberOfWeeklyRetentionDays" -type d -exec \
    "$cleanupCommand" {} \;
# Clean outdated monthly backups.
find "$targetPath" -mtime +"$numberOfMonthlyRetentionDays" -type d -exec \
    "$cleanupCommand" {} \;
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
