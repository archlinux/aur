import base64
import re
import requests
import yaml

GITHUB_API_URL = 'https://api.github.com/repos/janhq/jan/releases/latest'
YML_URL_TEMPLATE = 'https://github.com/janhq/jan/releases/download/v{}/latest-linux.yml'

# Fetch the latest version from GitHub API
def get_latest_version():
    response = requests.get(GITHUB_API_URL)
    response.raise_for_status()
    release_data = response.json()
    return release_data['name']

# Fetch the latest-linux.yml file
def download_yml(version):
    yml_url = YML_URL_TEMPLATE.format(version)
    response = requests.get(yml_url)
    response.raise_for_status()
    return yaml.safe_load(response.text)

# Extract the SHA512 checksum from the yml data
def get_sha512_from_yml(yml_data, version):
    for file_info in yml_data['files']:
        if file_info['url'] == f"jan-linux-x86_64-{version}.AppImage":
            return file_info['sha512']
    raise ValueError(f"SHA512 checksum for jan-linux-x86_64-{version}.AppImage not found in yml")

# Convert base64 to hexadecimal
def base64_to_hex(base64_string):
    decoded_bytes = base64.b64decode(base64_string)
    return decoded_bytes.hex()

# Update the PKGBUILD
def update_pkgbuild(version, sha512_hex):
    with open('PKGBUILD', 'r') as file:
        pkgbuild = file.read()

    # Update pkgver variable
    pkgbuild = re.sub(r'pkgver=\S+', f'pkgver={version}', pkgbuild)

    # Update sha512sums_x86_64 variable
    pkgbuild = re.sub(r'sha512sums_x86_64=\((.*?)\)', f'sha512sums_x86_64=(\'{sha512_hex}\')', pkgbuild)

    with open('PKGBUILD', 'w') as file:
        file.write(pkgbuild)

def main():
    try:
        version = get_latest_version()
        yml_data = download_yml(version)
        sha512_base64 = get_sha512_from_yml(yml_data, version)
        sha512_hex = base64_to_hex(sha512_base64)
        update_pkgbuild(version, sha512_hex)

        print("PKGBUILD updated successfully.")

    except Exception as e:
        print(f"Error updating PKGBUILD: {e}")

if __name__ == "__main__":
    main()
