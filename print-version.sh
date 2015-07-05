#!/usr/bin/env sh
#
# Print the currently installed django-extensions versions.
#

python - <<EOF
import faker
import sys
print('Python version: {}'.format(tuple(sys.version_info)))
print('faker version: {}'.format(faker.VERSION))
EOF

python2 - <<EOF
import faker
import sys
print('Python version: {}'.format(tuple(sys.version_info)))
print('faker version: {}'.format(faker.VERSION))
EOF
