#!/usr/bin/env bash

./SecoClientPromoteService -d

while ! pgrep SecoClientPromo; do
    sleep 0.1
done

pgrep SecoClientPromo > /var/run/SecoClientPromoteService.pid
