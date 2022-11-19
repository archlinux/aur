#!/usr/bin/env python

import sys
from ctypes import byref, c_char_p, c_int, cdll, create_string_buffer
from os.path import join


def extractLV2ManifestFromBinary(binaryPath: str, outputDir: str, binaryName: str):
    print("*** Extract LV2 manifest from binary...", file=sys.stderr);
    lib = cdll.LoadLibrary(binaryPath)

    if not lib.GenerateManifestFromClient:
        return "Couldn't find the symbol GenerateManifestFromClient in the plug-in"

    gen_manifest = lib.GenerateManifestFromClient
    gen_manifest.restype = c_int
    gen_manifest.argtypes =[c_char_p, c_int, c_char_p, c_int]

    # How much bytes do we need for the manifest?
    c_binaryName = c_char_p(binaryName.encode("utf-8"))
    manifestLen: int = gen_manifest(None, 0, c_binaryName, len(binaryName));

    # Generate the manifest again, this time copy it in a properly sized buffer.
    manifestBuf: c_char_p = create_string_buffer(manifestLen)
    manifestLen = gen_manifest(manifestBuf, manifestLen, c_binaryName, len(binaryName))
    lv2Manifest: str = manifestBuf.value.decode("utf-8");

    # write manifest
    manifestPath: str = join(outputDir, "manifest.ttl")

    with open(manifestPath, "w") as fp:
        fp.write(lv2Manifest)

    print( "   => Written {} bytes to {}.".format(len(lv2Manifest), manifestPath), file=sys.stderr)


if __name__ == '__main__':
    sys.exit(extractLV2ManifestFromBinary(*sys.argv[1:]) or 0)
