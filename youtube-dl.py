#!/usr/bin/env python

import sys
import yt_dlp

if __name__ == '__main__':
    yt_dlp.main(['--compat-options', 'youtube-dl'] + sys.argv[1:])
