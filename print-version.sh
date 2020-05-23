#!/usr/bin/env sh
#
# Print the currently installed factory_boy version.
#

python - <<EOF
import factory
print('Factory Boy version: {}'.format(factory.__version__))
EOF
