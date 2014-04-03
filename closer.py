#!/usr/bin/env python3
# determine the mirror dynamically
from pyquery import PyQuery as pq
import sys

ver = sys.argv[1]

print('If download failed, retry it', file=sys.stderr)
apache_flex_sdk_url = 'http://www.apache.org/dyn/closer.cgi/flex/%s/binaries/apache-flex-sdk-%s-bin.tar.gz' % (ver, ver)
dom = pq(url=apache_flex_sdk_url)
print(dom('.section-content a:first').attr('href'))
