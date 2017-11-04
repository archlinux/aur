import json
from pprint import pprint

with open('releases.json') as data_file:    
    data = json.load(data_file)

print(data[0]['tag_name'].split('v')[1])