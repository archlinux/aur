#!/bin/bash
trap 'popd' EXIT
pushd /opt/dataloader
java "-Dsalesforce.config.dir=${HOME}/.config/dataloader/" -jar "/opt/dataloader/target/dataloader-53.0.2-uber.jar"
