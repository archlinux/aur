#!/usr/bin/env sh
#
# Print the currently installed django-tables2 versions.
#

for interpreter in python python2; do
"${interpreter}" - <<EOF
import django_tables2
import sys
print('Python version: {}'.format(tuple(sys.version_info)))
print('django-extensions version: {}'.format(django_tables2.__version__))
EOF
done
