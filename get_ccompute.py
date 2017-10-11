#!/usr/bin/env python

"""
Obtain the correspondence of a local GPU name to its cuda compute capability
Names match the output of nvidia-smi --query-gpu=gpu_name --format=csv,noheader

Usage:
----
./get_ccompute.py <GPU_NAME>
"""
import sys
try:
    from urllib.request import urlopen
except ImportError:
    from urllib2 import urlopen
import collections

from bs4 import BeautifulSoup

def process(url):
    page = urlopen(url)

    text = page.read()
    page.close()

    soup = BeautifulSoup(text, "lxml")
    d = collections.defaultdict(str)

    for table in soup.findAll('table', {'class': 'table table-striped'}):
        for line in table.findAll('tr'):
            gpu = line.findNext('td').text.strip()
            compute = line.findNext('td').findNext('td').text.strip()
            d[gpu] = compute
    return d

def main():
    if len(sys.argv) > 1:
        gpu = sys.argv[1]
    if len(sys.argv) == 1:
        print("Usage: %s <GPU_NAME> ..." % sys.argv[0])
        sys.exit(1)
    # at least one gpu was passed
    d = process("https://developer.nvidia.com/cuda-gpus")
    print(d[gpu])

if __name__ == "__main__":
    main()
