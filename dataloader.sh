#!/bin/bash
trap 'popd' EXIT
pushd /opt/dataloader
java "-Dsalesforce.config.dir=${HOME}/.config/dataloader/" -jar "/opt/dataloader/target/dataloader-54.0.0-uber.jar"
