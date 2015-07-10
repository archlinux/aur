#!/usr/bin/env sh
#
# Print the currently installed django-extensions versions.
#

for interpreter in python python2; do
"${interpreter}" - <<EOF
import django_extensions
import sys
print('Python version: {}'.format(tuple(sys.version_info)))
print('django-extensions version: {}'.format(django_extensions.VERSION))
EOF
done
