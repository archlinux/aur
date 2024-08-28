#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys
import base64
import xml.etree.ElementTree as ET
from PIL import Image
from io import BytesIO as StringIO
import urllib.request

if len(sys.argv) < 2:
	print('Not enough actual parameters',file=sys.stderr)
	sys.exit(1)

inputFile = sys.argv[1]
outputFile = sys.argv[2]
if len(sys.argv) > 3:
	size = int(sys.argv[3])
else:
	size = 256

iFile = open(urllib.request.url2pathname(inputFile).split('file://')[1],'rb')
root = ET.parse(iFile).getroot()

def saveCover(cover_raw):
	cover_decoded = base64.b64decode(cover_raw)
	cover = Image.open(StringIO(cover_decoded))
	cover.thumbnail((size,size))
	cover.save(outputFile,"PNG")
	sys.exit(0)

for i in root.iter():
	if (i.tag.split('}')[1] == 'binary') and ('id' in i.attrib) and (i.attrib['id'].split('.')[0] == 'cover'):
		saveCover(i.text)

for i in root.iter():
	if (i.tag.split('}')[1] == 'binary') and ('content-type' in i.attrib) and (i.attrib['content-type'].split('/')[0] == 'image'):
		saveCover(i.text)

print('No cover inside',file=sys.stderr)
sys.exit(2)
