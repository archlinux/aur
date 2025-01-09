#!/usr/bin/bash

export $(cat /etc/linkwarden/app.conf)
yarn prisma migrate deploy
