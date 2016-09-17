#!/usr/bin/env bash

# Watches a list of urls and sends mails to configured email addresses if one
# doesn't fit the expected status code.

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
#
# account        gmail
# host           smtp.gmail.com
# port           587
# from           ACCOUNT_E_MAIL_ADDRESS
# user           ACCOUNT_NAME@gmail.com
# password       ACCOUNT_PASSWORD
#
# account        default : gmail

# Needed for the LSBInitScripts specification.
### BEGIN INIT INFO
# Provides:          isWebServerReachableWatcher
# Required-Start:
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: see above
# Description:       see above
### END INIT INFO

declare -A urls_to_check=(
    ['URL1']='200 RECIPIENT_E_MAIL_ADDRESS' \
    ['URL2']='200 RECIPIENT_E_MAIL_ADDRESS ANOTHER_RECIPIENT_E_MAIL_ADDRESS')
# Wait for 5 minutes (60 * 5 = 300)
delay_between_two_consequtive_requests_in_seconds='300'
date_time_format='%T:%N at %d.%m.%Y'
sender='ACCOUNT_E_MAIL_ADDRESS'
replier="$sender"
verbose=false
name='NODE_NAME'

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
From: $sender
To: $e_mail_address
Reply-To: $replier
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
