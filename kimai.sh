#!/bin/sh
# iconv is a module that is disabled by default on Arch
exec php -d extension=iconv /usr/share/kimai-cli/bin/kimai "$@"
