#!/usr/bin/env python3
import sys
import hashlib

baseromhash = 'f0b7f35375f9cc8ca1b2d59d78e35405'
baseromsize = 0x3600000

with open(sys.argv[1], 'rb') as f:
    filedata = bytearray(f.read(baseromsize))

### BYTEORDER CONVERTS
## LITTLE ENDIAN (.n64)
#if filedata[0] == 0x40:
#    filedata[0::4], filedata[1::4], filedata[2::4], filedata[3::4] = \
#        filedata[3::4], filedata[2::4], filedata[1::4], filedata[0::4]
#
## BYTE SWAPPED (.v64)
#elif filedata[0] == 0x37:
#    filedata[0::2], filedata[1::2] = filedata[1::2], filedata[0::2]

orighash = hashlib.md5(filedata).hexdigest()

## ROM PATCHES
# NZLP HEADER
filedata[0x3E] = 0x50 

# BLACKOUT REMAINING ONES
filedata[0x35CF000:] = [0xFF] * (len(filedata) - 0x35CF000)

patchedhash = hashlib.md5(filedata).hexdigest()

if patchedhash != baseromhash:
    print(f"Bad ROM! Expected {baseromhash} but got {patchedhash}.")
    sys.exit(1)

print("OK! Looks good.")
