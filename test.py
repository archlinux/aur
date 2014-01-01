#!/usr/bin/python2

import sys, pprint

#sys.path = sys.path + ["/usr/lib/python2.7/site-packages/Pywikipediabot-2.0b1-py2.7.egg"]
pprint.pprint(sys.path)

names = [
    "Pywikipediabot",
    "pywikibot"
]

for name in names:
    try:
        import name
        print("import success: " + name)
    except ImportError:
        print("import error: " + name)
