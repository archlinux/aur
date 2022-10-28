#!/usr/bin/env python
#
# convert all drumkit WAV files to FLAC
#

import os
import sys
from glob import glob
from os.path import basename, exists, join, splitext
from shutil import copyfile
from subprocess import check_call, check_output, DEVNULL

tempdir = os.environ.get("TMP", "/tmp")

for drumkit in sys.argv[1:]:
    drumkit_xml = join(drumkit, "drumkit.xml")

    if not exists(drumkit_xml):
        print("Drumkit {} not found. Skipping it.".format(drumkit))
        continue

    print("Converting samples to FLAC format in drumkit {}...".format(drumkit))

    for orig in glob(join(drumkit, "*.[Ww][Aa][Vv]")) + glob(join(drumkit, "*.[Aa][Ii][Ff][Ff]")):
        fn = basename(orig)
        bn, ext = splitext(fn)
        flac = "{}.flac".format(bn)

        if exists(orig) and not exists(join(drumkit, flac)):
            bbs = check_output(["soxi", "-b", orig]).strip()

            if int(bbs) > 24:
                print("Reducing sample size of '{}' to 24 bit ...".format(fn))
                temp = check_output(["mktemp", join(tempdir, "hydrogen-drumkits.XXXXXX." + ext)]).strip()

                try:
                    check_call(["sox", orig, "-b", "24", "-e", "signed-integer", temp])
                except:
                    print("Could not reduce sample size of '{}'.".format(fn))
                    continue
                else:
                    copyfile(temp, orig)
                    os.unlink(temp)

            try:
                check_call(["flac", "-s", "-8", "--keep-foreign-metadata", orig], stdout=DEVNULL,
                           stderr=DEVNULL)
            except:
                print("Could not convert '{}', keeping file in WAV format.".format(orig))
                try:
                    os.unlink(join(drumkit, flac))
                except: pass
            else:
                with open(drumkit_xml) as fp:
                    xml = fp.read()

                with open(drumkit_xml, 'w') as fp:
                    fp.write(xml.replace(fn, flac))

        try:
            os.unlink(orig)
        except:
            print("Warning: could not remove '%s'.", file=sys.stderr)
