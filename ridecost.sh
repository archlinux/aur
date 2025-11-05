#!/usr/bin/env bash

export JAVA_HOME=$(archlinux-java-run --min 17 --java-home)

java -cp "/usr/share/java/ridecost/*" io.gitlab.vitalijr2.ridecost.cli.RideCost "$@"

