#!/bin/bash
canary="/opt/discord-canary/resources"
development="/opt/discord-development/resources"
stable="/opt/discord/resources"
canary_electron="/usr/lib/discord-canary"
installOA () {
mv $1/app.asar $1/app.asar.old
cp /usr/share/openasar/app.asar $1/app.asar
}

if test -f "$stable/app.asar"; then
 installOA $stable
 echo "Installed OpenAsar for Stable"
 fi

if test -f "$canary/app.asar"; then
  installOA $canary
  echo "Installed OpenAsar for Canary"
  fi

if test -f "$development/app.asar"; then
 installOA $development
 echo "Installed OpenAsar for Development"
 fi

if test -f "$canary_electron/app.asar"; then 
 installOA $canary_electron
 echo "Installed OpenAsar for Canary with system Electron"
 fi
