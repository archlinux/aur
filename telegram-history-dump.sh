#!/bin/sh

if [ ! -d ~/telegram-history-dump ]; then
    mkdir ~/telegram-history-dump
fi
if [ ! -f ~/telegram-history-dump/config.yaml ]; then
    cp /opt/telegram-history-dump/config.yaml ~/telegram-history-dump/config.yaml
    cat << EOF
Created configuration file at ~/telegram-history-dump/config.yaml
Please edit this config file first and then execute this command again

Also REMEMBER you MUST execute telegram-cli first with:
    telegram-cli --json -P 9009

EOF
    exit 0
fi

ruby /opt/telegram-history-dump/telegram-history-dump.rb
