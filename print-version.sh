#!/usr/bin/env sh
#
# Print the currently installed factory_boy versions.
#

for interpreter in python python2; do
"${interpreter}" - <<EOF
import factory
import sys
print('Python version: {}'.format(tuple(sys.version_info)))
print('Factory Boy version: {}'.format(factory.__version__))
EOF
done
