#!/usr/bin/env python

# Author: Eric Toombs <ee double you toombs at you waterloo dot see eh?>

# Run this script in parity's source directory to output parity's version.  
# Used in pkgver().

import json
from subprocess import check_output

metadata = json.loads(check_output(
    'cargo metadata --no-deps --format-version 1'.split()))

for p in metadata['packages']:
    if p['name'] == 'parity':
        print(p['version'])
        break
