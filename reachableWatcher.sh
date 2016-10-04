#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de

# Watches a list of urls and sends mails to configured email addresses if one
# doesn't fit the expected status code.

# Dependencies:

# - bash (or any bash like shell)
# - curl - Transfers a url contents.
# - date - Print or set the system date and time.
# - grep - Print lines matching a pattern.
# - msmtp - An SMTP client.
# - sleep - Delay for a specified amount of time.

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
# declare -A urls_to_check=(
#     ['URL1']='200 RECIPIENT_E_MAIL_ADDRESS' \
#     ['URL2']='200 RECIPIENT_E_MAIL_ADDRESS ANOTHER_RECIPIENT_E_MAIL_ADDRESS')
declare -A urls_to_check=()
# Wait for 5 minutes (60 * 5 = 300)
delay_between_two_consequtive_requests_in_seconds='300'
date_time_format='%T:%N at %d.%m.%Y'
sender_e_mail_address='ACCOUNT_E_MAIL_ADDRESS'
replier_e_mail_address="$sender_e_mail_address"
verbose=false
name='NODE_NAME'
# endregion
# region load options if present
if [ -f /etc/reachableWatcher ]; then
    source /etc/reachableWatcher
fi
# endregion
# region controller
while true; do
    for url_to_check in "${!urls_to_check[@]}"; do
        expected_status_code="$(echo "${urls_to_check[$url_to_check]}" | grep \
            '^[^ ]+' --only-matching --extended-regexp)"
        $verbose && echo \
            "Check url \"$url_to_check\" for status code $expected_status_code."
        current_status_code="$(curl --insecure --output /dev/null --silent \
            --head --write-out '%{http_code}' "$url_to_check")"
        if [[ "$current_status_code" != "$expected_status_code" ]]; then
            message="Requested URL \"$url_to_check\" returns status code $current_status_code (instead of \"$expected_status_code\") on $(date +"$date_time_format")."
            for e_mail_address in $(echo "${urls_to_check[$url_to_check]}" | \
                grep ' .+$' --only-matching --extended-regexp)
            do
                $verbose && echo "$message" >/dev/stderr
                msmtp -t <<EOF
From: $sender_e_mail_address
To: $e_mail_address
Reply-To: $replier_e_mail_address
Date: $(date)
Subject: $name registers: "$url_to_check" responses with status code $current_status_code!

$message

EOF
            done
        fi
    done
    $verbose && echo "Wait for $delay_between_two_consequtive_requests_in_seconds seconds until next check."
    sleep "$delay_between_two_consequtive_requests_in_seconds"
done
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
