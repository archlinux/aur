#!/usr/bin/env python3
# determine the mirror dynamically
from pyquery import PyQuery as pq
import sys

print('If download failed, retry it', file=sys.stderr)
apache_flex_sdk_url = 'http://www.apache.org/dyn/closer.cgi/flex/4.11.0/binaries/apache-flex-sdk-4.11.0-bin.tar.gz'
dom = pq(url=apache_flex_sdk_url)
print(dom('.section-content a:first').attr('href'))
