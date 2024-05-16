import re
import requests
import subprocess

CHANNEL = "preview"
CARCH = "x86_64"

url = f"https://zed.dev/releases/{CHANNEL}"

VERSION_RE = re.compile(
    rf"(/api/releases/{CHANNEL}/(\d+\.\d+\.\d+)/zed-linux-{CARCH}.tar.gz)"
)


def get_versions():
    response = requests.get(url)
    response.raise_for_status()
    html = response.text
    versions = dict(map(reversed, VERSION_RE.findall(html)))
    if not versions:
        raise Exception(f"No versions found in {html}")

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
PKGBUILD = PKGBUILD.replace(pkgver, last_version)
with open("PKGBUILD", "w") as f:
    f.write(PKGBUILD)

# Update sha256sums with updpkgsums
subprocess.run(["updpkgsums"])

# Try building the package
subprocess.run(["makepkg", "-si"])

# Update .SRCINFO
# Run makepkg --printsrcinfo get stdout and save it to .SRCINFO
subprocess.run(["makepkg", "--printsrcinfo"], stdout=open(".SRCINFO", "w"))

# Ask to commit changes
subprocess.run(["git", "add", "PKGBUILD"])
subprocess.run(["git", "add", ".SRCINFO"])
subprocess.run(["git", "diff", "--cached"])
input("Commit changes? [Enter]")

# Commit changes
subprocess.run(["git", "commit", "-m", f"Update to {last_version}"])
subprocess.run(["git", "push"])
