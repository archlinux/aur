#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# SPDX-License-Identifier: CC0-1.0
# Source: https://gist.github.com/parly/a62d3f69abab8a16e878134d610d8cdc

# To install the prerequisites, use the command below:
#   pacman -S python python-beautifulsoup4 python-requests

import json

from bs4 import BeautifulSoup
import requests


def main():
    data = get_json()
    url = None
    for download in data['props']['pageProps']['page']['downloads']:
        filename = download['file']
        if filename.endswith('-fc38.x86_64.rpm'):
            url = f'https://www.tenable.com/downloads/api/v1/public/pages/nessus/downloads/{download["id"]}/download?i_agree_to_tenable_license_agreement=true'
            break

    if url is not None:
        print(filename)
        print(url)
    else:
        print('Cannot find a download link!')


def get_json():
    res = requests.get('https://www.tenable.com/downloads/nessus')
    soup = BeautifulSoup(res.text, 'html.parser')
    tag = soup.find(id='__NEXT_DATA__')
    return json.loads(tag.string)



if __name__ == '__main__':
    main()
