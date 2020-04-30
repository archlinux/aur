#!/usr/bin/env bash
java -Dtlauncher.bootstrap.targetLibFolder=/opt/tlauncher/lib -Dtlauncher.bootstrap.brand=legacy_beta -Dtlauncher.bootstrap.ignoreSelfUpdate=true -Dtlauncher.bootstrap.ignoreUpdate=true -Dtlauncher.bootstrap.targetJar=/opt/tlauncher/launcher.jar -jar /opt/tlauncher/bootstrap.jar
