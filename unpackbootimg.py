#!/usr/bin/env python
import sys
import struct

BOOT_MAGIC = 'ANDROID!'.encode()

HEADER_FORMAT = '8s10I16s512s32s1024s'
HEADER_SIZE = struct.calcsize(HEADER_FORMAT)

def extract_file(f, name, pos, size):
    f.seek(pos)
    with open(name, 'wb') as o:
        o.write(f.read(size))

def unpack_image(f):
    header = struct.unpack(HEADER_FORMAT, f.read(HEADER_SIZE)[:HEADER_SIZE])

    # Ensure this is an Android boot image
    if header[0] != BOOT_MAGIC:
        print("Image does not appear to be an Android boot image")
        exit(1)

    page_size = header[8]
    page_mask = page_size - 1

    # Extract kernel
    kernel_size = header[1]
    extract_file(f, 'kernel', page_size, kernel_size)

    # Extract ramdisk
    ramdisk_size = header[3]
    extract_file(f, 'ramdisk', page_size + (kernel_size + page_mask) & ~page_mask, ramdisk_size)

    # Extract command line
    cmdline = header[12].decode().rstrip('\0') + header[12].decode().rstrip('\0')

    with open('cmdline.txt', 'w') as o:
        o.write(cmdline)

with open(sys.argv[1], 'rb') as f:
    unpack_image(f)
