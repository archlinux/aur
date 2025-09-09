#!/bin/sh
# gnushark-runroot v1
umask 022
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
unset BASH_ENV ENV
exec /usr/bin/bash -s
