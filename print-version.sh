#!/usr/bin/env sh
#
# Print the currently installed django-extensions versions.
#

for interpreter in python python2; do
"${interpreter}" - <<EOF
import faker
import sys
print('Python version: {}'.format(tuple(sys.version_info)))
print('faker version: {}'.format(faker.VERSION))
EOF
done
