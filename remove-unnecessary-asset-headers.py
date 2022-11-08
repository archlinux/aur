#!/usr/bin/env python3
import multiprocessing as mp
from glob import glob, iglob
from itertools import chain, product
from functools import partial
import os
import re

def get_includes(header_list, src_file, *, prefix=""):
    includes = []
    header_list_strip = [l.removeprefix(prefix) for l in header_list]
    for line in open(src_file, 'r'):
        match = re.match(r'^\s*#\s*include\s+("[^"]+?"|<[^>]+?>)', line)
        if match is not None:
            try:
                hdrfile = match.group(1)[1:-1]
                if hdrfile in header_list:
                    includes.append(hdrfile)
                elif hdrfile in header_list_strip:
                    includes.append(prefix + hdrfile)
            except IndexError: pass
    return src_file, includes


if __name__ == '__main__':
    asset_folder = "assets"
    file_folders = ["soh", "src"]
    file_extensions = ['c', 'cpp', 'h', 'hpp']

    asset_headers = glob(asset_folder+"/**/*.h", recursive=True)
    srcfiles = [glob("{}/**/*.{}".format(*a), recursive=True) for a in product(file_folders, file_extensions)]

    # find included files from source files found in assets
    get_includes_partial = partial(get_includes, asset_headers, prefix=asset_folder+"/")
    with mp.Pool(mp.cpu_count()) as p:
        included_srcfiles = p.map(get_includes_partial, chain(*srcfiles))
    # remove source files not in specified headers
    included_srcfiles = dict(filter(lambda l: len(l[1]), included_srcfiles))

    included_headers = set(h for f in included_srcfiles.values() for h in f)
    for hdr in asset_headers:
        if hdr not in included_headers:
            os.remove(hdr)
