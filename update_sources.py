#!/usr/bin/env python
import hashlib
import requests
import sys
from requests.compat import urljoin
import xml.etree.ElementTree as ET

JNLP_SOURCE = 'https://www.jalview.org/webstart/jalview.jnlp'
BASE_URL = 'https://www.jalview.org/webstart/'

EXTRA_SOURCES = [
    ("logo.gif", '362790ef6d3e3c537a6d31663a0e7f3ec9664c90cb9dc6df4a80b016f474eaa4'),
    ("jalview", 'd5d4f97f520d58ddb8f2552800f946c2ab6c89c3dd105b7a9cd777b9925bc17e'),
    ("jalview.desktop", '4c87a84ec39e677fe2922a5e78cf68cf508ec8dff5211193b11aac7cb1cf4211'),
]


def get_jars():
    r = requests.get(JNLP_SOURCE)
    assert r.status_code == 200

    root = ET.fromstring(r.text)

    return [
        m.attrib['href']
        for r in root.findall('./resources')
        for m in r.findall('./jar')
        if not r.attrib.get('os')
    ]


def download_and_digest(url):
    sys.stderr.write('Getting {} ...\n'.format(url))
    r = requests.get(url)
    assert r.status_code == 200

    digest = hashlib.sha256()
    digest.update(r.content)
    return digest.hexdigest()


def patch_pkgbuild(replacement):
    replacement = replacement.split('\n')

    with open('PKGBUILD', 'r') as f:
        content = f.read().split('\n')

    i = content.index('### <INJECT_HERE> ###')
    j = content.index('### </INJECT_HERE> ###')

    assert i >= 0
    assert j >= 0

    content[(i + 1):j] = replacement

    content = '\n'.join(content)

    with open('PKGBUILD', 'w') as f:
        f.write(content)


def format_bash_array(arr, indent='  '):
    return '(\n{}\n)'.format(
        '\n'.join(
            "{}'{}'".format(indent, a)
            for a in arr
        )
    )


def main():
    jars = get_jars()

    full_urls = [
        (full_url, download_and_digest(full_url))
        for jar in jars
        for full_url in (urljoin(BASE_URL, jar), )
    ]

    full_urls += EXTRA_SOURCES

    payload = """
source={}

noextract={}

sha256sums={}
""".format(
        format_bash_array(s for s, _ in full_urls),
        format_bash_array(j for j in jars),
        format_bash_array(d for _, d in full_urls)
    )

    patch_pkgbuild(payload)


if __name__ == "__main__":
    main()
