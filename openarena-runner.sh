#!/usr/bin/env bash

arch=$(uname -m)
file=`basename "$0"`
if [ "$file" == 'openarena' ]; then
  file='openarena'
else
  file='oa_ded'
fi
cd '/usr/lib/openarena'

# Comment by syrjala
#  openarena-runner.sh should pass on the command line options. I just banged my
#  head against the wall for a while trying to figure out why my command line
#  options didn't do anything.
# So, here it is
"./${file}.${arch}" $@
