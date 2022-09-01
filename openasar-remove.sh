#!/bin/bash
canary="/opt/discord-canary/resources"
development="/opt/discord-development/resources"
stable="/opt/discord/resources"
removeOA () {
rm -f $1/app.asar
mv $1/app.asar.old $1/app.asar
}

if test -f "$stable/app.asar"; then
 removeOA $stable
 fi

if test -f "$canary/app.asar"; then
 removeOA $canary
 fi

if test -f "$development/app.asar"; then
 removeOA $development
 fi
