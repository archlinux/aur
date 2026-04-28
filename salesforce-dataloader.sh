#! /usr/bin/env bash

java --enable-native-access=ALL-UNNAMED "-Dsalesforce.config.dir=${HOME}/.config/dataloader/" -jar "/opt/salesforce-dataloader/dataloader.jar" "$@"
