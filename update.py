import subprocess
import requests
import string
from pathlib import Path
from email.utils import parsedate_to_datetime
from datetime import datetime, timedelta, timezone

NAME = 'linux'
REPO = 'core'

# Script to update the PKGBUILD to the latest [core]/linux

def get_current_version():
    pkgbuild = Path('.SRCINFO').read_text('utf8')
    pkgver = pkgbuild.split('pkgver =', 1)[1].splitlines()[0].strip()
    pkgrel = pkgbuild.split('pkgrel =', 1)[1].splitlines()[0].strip()
    return pkgver, pkgrel

def get_pkg_info(pkgname):
    url = f"https://archlinux.org/packages/{REPO}/x86_64/{pkgname}/json/"
    response = requests.get(url, timeout=10)
    return response.json()

def get_arch_archive_age(filename):
    """Check if a package file is on the Arch Linux Archive and return its age as a
    datetime.timedelta, or timedelta(0) if it's a 404"""
    url = f"https://archive.archlinux.org/packages/.all/{filename}"
    response = requests.head(url, timeout=10)
    if not response.ok:
        return timedelta(0)
    now = datetime.now(timezone.utc)
    last_modified = parsedate_to_datetime(response.headers['Last-Modified'])
    return now - last_modified 

class Template(string.Template):
    delimiter="%"


def arr(name, values):
    delimiter = '\n' + ' ' * (len(name) + 4)
    values = [f"'{value}'" if ':' in value else value for value in values]
    return f"{name}=({delimiter.join(values)})"


def update(kern_info):
    headers_info = get_pkg_info(f'{NAME}-headers')
    docs_info = get_pkg_info(f'{NAME}-docs')

    template = Template(Path('PKGBUILD.template').read_text('utf8'))

    kernver, archver = kern_info['pkgver'].rsplit('.', 1)
    pkgrel = kern_info['pkgrel']
    padded_kernver = kernver if len(kernver.split('.')) == 3 else kernver + '.0'
    
    pkgbuild = template.substitute(
        KERNVER=kernver,
        ARCHVER=archver,
        PKGVER=kern_info['pkgver'],
        PKGREL=kern_info['pkgrel'],
        KERNNAME=f"{padded_kernver}-{archver}-{pkgrel}",
        URL=kern_info['url'],
        KERN_PKG=kern_info['filename'],
        KERN_PKGDESC=kern_info['pkgdesc'],
        KERN_DEPENDS=arr("depends", kern_info['depends']),
        KERN_CONFLICTS=arr("conflicts", kern_info['conflicts'] + ['"${_pkgname}"']),
        KERN_OPTDEPENDS=arr("optdepends", kern_info['optdepends']),
        KERN_PROVIDES=arr("provides", kern_info['provides']),
        KERN_REPLACES=arr("replaces", kern_info['replaces']),
        HEADERS_PKG=headers_info['filename'],
        HEADERS_PKGDESC=headers_info['pkgdesc'],
        HEADERS_DEPENDS=arr("depends", headers_info['depends']),
        HEADERS_CONFLICTS=arr(
            "conflicts", headers_info['conflicts'] + ['"${_pkgname}-headers"']
        ),
        HEADERS_OPTDEPENDS=arr("optdepends", headers_info['optdepends']),
        HEADERS_PROVIDES=arr("provides", headers_info['provides']),
        HEADERS_REPLACES=arr("replaces", headers_info['replaces']),
        DOCS_PKG=docs_info['filename'],
        DOCS_PKGDESC=docs_info['pkgdesc'],
        DOCS_DEPENDS=arr("depends", docs_info['depends']),
        DOCS_CONFLICTS=arr(
            "conflicts", docs_info['conflicts'] + ['"${_pkgname}-docs"']
        ),
        DOCS_OPTDEPENDS=arr("optdepends", docs_info['optdepends']),
        DOCS_PROVIDES=arr("provides", docs_info['provides']),
        DOCS_REPLACES=arr("replaces", docs_info['replaces']),
    )

    # Delete empty arrays:
    pkgbuild = '\n'.join(
        line for line in pkgbuild.splitlines() if not line.endswith('=()')
    )
    Path('PKGBUILD').write_text(pkgbuild + '\n', 'utf8')

    # Update source sha256sums and then delete the files:
    subprocess.check_call(['updpkgsums'])
    for info in [kern_info, headers_info, docs_info]:
        Path(info['filename']).unlink(missing_ok=True)

    # srcinfo
    with open('.SRCINFO', 'w', encoding='utf8') as f:
        f.write(subprocess.check_output(['makepkg', '--printsrcinfo']).decode())

    # commit and push
    subprocess.check_call(['git', 'add', 'PKGBUILD', '.SRCINFO'])
    subprocess.check_call(
        ['git', 'commit', '-m', f"{kern_info['pkgver']}-{kern_info['pkgrel']}"]
    )
    subprocess.check_call(['git', 'push'])


if __name__ == '__main__':

    # Minimum age of a kernel package file on the Arch Linux Archive before we consider
    # updating to it. This is to avoid things like the mirror being partially updated,
    # or the kernel pulling in a dependency not yet in the users' mirror, etc.
    MINIMUM_PACKAGE_AGE = timedelta(days=1)

    kern_info = get_pkg_info(NAME)
    current_version = get_current_version()
    latest_version = kern_info['pkgver'], kern_info['pkgrel']
    arch_archive_age = get_arch_archive_age(kern_info['filename'])

    if (current_version != latest_version) and arch_archive_age > MINIMUM_PACKAGE_AGE:
        print(f"{NAME}-versioned-bin is out of date!")
        update(kern_info)
    else:
        print(f"{NAME}-versioned-bin is up to date")
