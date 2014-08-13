import requests
import pyquery

r = requests.get('http://flex.apache.org/download-binaries.html')
d = pyquery.PyQuery(r.text)
print(d('.headline h4').eq(0).text())
