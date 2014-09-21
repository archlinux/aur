import requests
import pyquery
import re

r = requests.get('http://flex.apache.org/download-binaries.html')
d = pyquery.PyQuery(r.text)
ver_text = d('.headline h4').eq(0).text()
print(re.match('^Current Release \((.*)\)$', ver_text).group(1))
