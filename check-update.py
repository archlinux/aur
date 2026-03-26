#!/usr/bin/env python3

import hashlib
import json
import re
import subprocess
import sys
import urllib.request
import urllib.error
import shutil

def fetch_json(url):
    req = urllib.request.Request(url, headers={'User-Agent': 'oh-my-pi-aur-updater'})
    try:
        with urllib.request.urlopen(req) as response:
            return json.loads(response.read().decode('utf-8'))
    except urllib.error.URLError as e:
        print(f"Error fetching {url}: {e}", file=sys.stderr)
        sys.exit(1)

def fetch_bytes(url):
    req = urllib.request.Request(url, headers={'User-Agent': 'oh-my-pi-aur-updater'})
    try:
        with urllib.request.urlopen(req) as response:
            return response.read()
    except urllib.error.URLError as e:
        print(f"Error fetching {url}: {e}", file=sys.stderr)
        sys.exit(1)

def main():
    try:
        with open('PKGBUILD', 'r') as f:
            content = f.read()
    except FileNotFoundError:
        print("PKGBUILD not found", file=sys.stderr)
        sys.exit(1)

    m = re.search(r'^pkgver=(\S+)', content, re.MULTILINE)
    if not m:
        print("Could not find pkgver in PKGBUILD", file=sys.stderr)
        sys.exit(1)

    current_ver = m.group(1)

    release_data = fetch_json('https://api.github.com/repos/can1357/oh-my-pi/releases/latest')
    tag_name = release_data.get('tag_name', '')
    if not tag_name.startswith('v'):
        print(f"Unexpected tag_name format: {tag_name}", file=sys.stderr)
        sys.exit(1)

    latest_ver = tag_name[1:]

    cur_tuple = tuple(int(x) for x in current_ver.split('.'))
    lat_tuple = tuple(int(x) for x in latest_ver.split('.'))

    if lat_tuple <= cur_tuple:
        print("already up to date")
        sys.exit(0)

    print(f"Update available: {current_ver} -> {latest_ver}")
    ans = input("Update? [y/N]: ")
    if ans.lower() != 'y':
        print("Aborted.")
        sys.exit(0)

    assets = release_data.get('assets', [])
    binary_sha = None

    for asset in assets:
        if asset.get('name') == 'omp-linux-x64':
            digest = asset.get('digest', '')
            if digest:
                if digest.startswith('sha256:'):
                    binary_sha = digest[7:]
                else:
                    binary_sha = digest
            else:
                # Fallback to downloading and computing sha256
                print("Digest not found in API response, downloading asset to compute sha256...")
                asset_bytes = fetch_bytes(asset.get('browser_download_url'))
                binary_sha = hashlib.sha256(asset_bytes).hexdigest()
            break

    if not binary_sha:
        print("Could not find omp-linux-x64 asset or its digest", file=sys.stderr)
        sys.exit(1)

    license_bytes = fetch_bytes(f'https://raw.githubusercontent.com/can1357/oh-my-pi/v{latest_ver}/LICENSE')
    license_sha = hashlib.sha256(license_bytes).hexdigest()

    content = re.sub(r'^pkgver=\S+', f'pkgver={latest_ver}', content, flags=re.MULTILINE)
    content = re.sub(r'^pkgrel=\S+', 'pkgrel=1', content, flags=re.MULTILINE)

    content = re.sub(
        r"sha256sums=\('[0-9a-f]+'\n\s+'[0-9a-f]+'\)",
        f"sha256sums=('{binary_sha}'\n            '{license_sha}')",
        content,
        flags=re.DOTALL
    )

    with open('PKGBUILD', 'w') as f:
        f.write(content)

    print("PKGBUILD updated.")

    if not shutil.which('makepkg'):
        print("makepkg not found, skipping .SRCINFO generation", file=sys.stderr)
    else:
        try:
            res = subprocess.run(['makepkg', '--printsrcinfo'], capture_output=True, text=True, check=True)
            with open('.SRCINFO', 'w') as f:
                f.write(res.stdout)
            print(".SRCINFO generated.")
        except subprocess.CalledProcessError as e:
            print(f"makepkg failed: {e}", file=sys.stderr)
            sys.exit(1)

    print("Success.")

if __name__ == '__main__':
    main()
