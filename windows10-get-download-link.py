#!/usr/bin/env python3
from __future__ import print_function
import requests, yaml, sys
from html.parser import HTMLParser

def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)
def einput(question):
    eprint(question, end='')
    return input()
    
langlist = requests.get('https://www.microsoft.com/en-US/api/controls/contentinclude/html?pageId=a8f8f489-4c7f-463a-9ca6-5cff94d8d041&host=www.microsoft.com&segments=software-download%2cwindows10ISO&query=&action=getskuinformationbyproductedition&productEditionId=244&sdVersion=2').text

objects = []
class ObjectParser(HTMLParser):
    def handle_starttag(self, tag, attrs):
        if tag in ['option', 'input']:
            for k, v in attrs:
                if k == 'value' and v:
                    objects.append(yaml.load(v))

parser = ObjectParser()
parser.feed(langlist)

eprint('Available languages:')
for i, lang in enumerate(objects):
    eprint(' [{}] {}'.format(i, lang['language']))

choice = objects[int(einput('Your choice: '))]
objects = []


links = requests.get('https://www.microsoft.com/en-US/api/controls/contentinclude/html?pageId=cfa9e580-a81e-4a4b-a846-7b21bf4e2e5b&host=www.microsoft.com&segments=software-download%2cwindows10ISO&query=&action=GetProductDownloadLinksBySku&skuId={id}&language=dummy&sdVersion=2'.format(**choice)).text
parser.feed(links)

eprint()
eprint('Available downloads:')
for i, download in enumerate(objects):
    eprint(' [{}] {} ({})'.format(i, download['Name'], download['DownloadType'][3:]))
choice = objects[int(einput('Your choice: '))]

eprint()
print(choice['Uri'])
