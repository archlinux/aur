#!/usr/bin/env bash

sudo -u secoclient ./SecoClientPromoteService -d

while ! pgrep SecoClientPromo; do
    sleep 0.1
done

pgrep SecoClientPromo > /var/run/SecoClientPromoteService.pid
