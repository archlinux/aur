import sys
import requests
import re
import json


s = requests.Session()

if len(sys.argv) != 3:
    sys.exit(1)


site = 'https://www.fosshub.com/'
downloadapp = sys.argv[1]
downloadsite = site + downloadapp

r = s.get(downloadsite)
x = re.search(r'var settings =(.+)$',r.text, re.M)
settings_text = x.group(1)
settings = json.loads(settings_text)

pool = settings['pool']
files = pool['f']
project = pool['p']

def download(p, r, n):
    headers = {'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36' ,
               'origin': 'https://www.fosshub.com',
               'sec-fetch-mode': 'cors',
               'sec-fetch-site': 'same-site',
               'sec-fetch-dest': 'empty'
               }
    post_json = {
                    "projectId":project,
                    "releaseId":r,
                    "projectUri":downloadapp,
                    "fileName":n,
                    "isLatestVersion":True,
                    "source":"CF"
                }

    r = s.post('https://api.fosshub.com/download/', json=post_json)
    response_json = r.json()

    error = response_json['error']
    if error is None:
        data = response_json['data']
        url = data['url']
        print(url)
        sys.exit(0)
    

for file in files:
    name = file['n']
    rc = file['r']
    match = re.fullmatch(sys.argv[2], name)
    if match:
        download(project, rc, name)
        break
        
sys.exit(2)