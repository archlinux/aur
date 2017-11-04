import json
from pprint import pprint

with open('releases.json') as data_file:    
    data = json.load(data_file)

latest = data[0]
build_number = latest['tag_name'].split('-')[1]
build_name_parts = latest['assets'][0]['name'].split('-')
build_date = build_name_parts[2]
build_id = build_name_parts[3].split(".")[0]

print('_'.join([build_number, build_date, build_id]))