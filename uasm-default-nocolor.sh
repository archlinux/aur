#!/bin/bash

# https://superuser.com/a/380778/744579
/usr/bin/uasm-color $@ | sed 's/\x1b\[[0-9;]*m//g'

# https://stackoverflow.com/a/18000433/8243991
# /usr/bin/uasm-color $@ | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"