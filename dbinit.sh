#!/usr/bin/bash

export $(cat /etc/linkwarden/app.conf)
corepack enable --install-directory bin
corepack yarn prisma:generate
corepack yarn prisma:deploy

# install playwright
cd apps/web
corepack yarn playwright install
