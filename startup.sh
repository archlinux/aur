#!/bin/sh

[ ! -e app ] && ln -s /usr/lib/telerising-api-bin/app .
exec /usr/lib/telerising-api-bin/api
