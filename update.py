import re
import requests
import subprocess

CHANNEL = "preview"
CARCH = "x86_64"

url = "https://api.github.com/repos/zed-industries/zed/releases"

VERSION_RE = re.compile(
    rf"/v(.*){'-pre' if CHANNEL == 'preview' else ''}/zed-linux-{CARCH}.tar.gz"
)


def get_versions():
    response = requests.get(url)
    response.raise_for_status()
    releases = [
        release
        for release in response.json()
        if release["prerelease"] == (CHANNEL == "preview")
    ]

    urls = [
        asset["browser_download_url"]
        for release in releases
        for asset in release["assets"]
        if asset["name"] == "zed-linux-x86_64.tar.gz"
    ]
    versions = {VERSION_RE.search(url).group(1): url for url in urls}

    if not versions:
        raise Exception(f"No versions found in {releases}")

    return versions


versions = get_versions()
print(f"Found versions: {', '.join(versions.keys())}")
last_version = max(versions.keys())
# url = versions[last_version]

# Check current pkgver in PKGBUILD
with open("PKGBUILD") as f:
    PKGBUILD = f.read()

PKGVER_RE = re.compile(r"pkgver=(\d+\.\d+\.\d+)")
pkgver = PKGVER_RE.search(PKGBUILD).group(1)

if pkgver == last_version:
    print("No new version found")
    exit(0)

print(f"New version found: {last_version}")

# Update PKGBUILD
SOURCE_RE = re.compile(r"source=\(\"\$pkgname-\$pkgver.tar.gz::(.*)\"\)")
source = SOURCE_RE.search(PKGBUILD).group(1)

PKGBUILD = PKGBUILD.replace(pkgver, last_version).replace(
    source, versions[last_version]
)
with open("PKGBUILD", "w") as f:
    f.write(PKGBUILD)

# Update sha256sums with updpkgsums
subprocess.check_call(["updpkgsums"])

# Try building the package
subprocess.check_call(["makepkg", "-si"])

# Update .SRCINFO
# Run makepkg --printsrcinfo get stdout and save it to .SRCINFO
subprocess.check_call(["makepkg", "--printsrcinfo"], stdout=open(".SRCINFO", "w"))

# Ask to commit changes
subprocess.check_call(["git", "add", "PKGBUILD"])
subprocess.check_call(["git", "add", ".SRCINFO"])
subprocess.check_call(["git", "diff", "--cached"])
input("Commit changes? [Enter]")

# Commit changes
subprocess.check_call(["git", "commit", "-m", f"Update to {last_version}"])
subprocess.check_call(["git", "push"])
