import requests
import re

r = requests.get('https://pypi.python.org/pypi/pip')
print(re.search(r'<a href="/pypi/pip/([^"]+)">', r.text).group(1))
