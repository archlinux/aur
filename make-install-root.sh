#!/usr/bin/bash

mkdir -p $2
mkdir -p $2/mail
mkdir -p $2/n/cd
mkdir -p $2/n/client/chan
mkdir -p $2/n/client/dev
mkdir -p $2/n/disk
mkdir -p $2/n/dist
mkdir -p $2/n/dos
mkdir -p $2/n/dump
mkdir -p $2/n/ftp
mkdir -p $2/n/gridfs
mkdir -p $2/n/kfs
mkdir -p $2/n/local
mkdir -p $2/n/rdbg
mkdir -p $2/n/registry
mkdir -p $2/n/remote
mkdir -p $2/tmp
mkdir -p $2/usr

cp -r $1/acme $2/
cp -r $1/appl $2/
cp -r $1/dis $2/
cp -r $1/doc $2/
cp -r $1/fonts $2/
cp -r $1/icons $2/
cp -r $1/keydb $2/
cp -r $1/lib $2/
cp -r $1/locale $2/
cp -r $1/man $2/
cp -r $1/module $2/
cp -r $1/services $2/
cp -r $1/usr $2/
