import subprocess
import json
import string
from pathlib import Path

NAME = 'linux-zen'

# Script to update the PKGBUILD to the latest [extra]/linux-zen

def get_current():
    cmd = ['bash', '-c', 'source PKGBUILD; echo ${pkgver}-${pkgrel}']
    version = subprocess.check_output(cmd).decode('utf8').strip()
    return version


def get_latest():
    cmd = ['pacman', '-Si', NAME]
    info = subprocess.check_output(cmd).decode('utf8').strip()
    version = info.split('Version', 1)[1].split(':', 1)[1].split('\n', 1)[0].strip()
    return version


def get_info(pkgname):
    url = f"https://archlinux.org/packages/extra/x86_64/{pkgname}/json/"
    data = subprocess.check_output(['curl', '-s', url]).decode()
    return json.loads(data)


class Template(string.Template):
    delimiter="%"


def arr(name, values):
    delimiter = '\n' + ' ' * (len(name) + 4)
    values = [f"'{value}'" if ':' in value else value for value in values]
    return f"{name}=({delimiter.join(values)})"


def update():
    kern_info = get_info(NAME)
    headers_info = get_info(f'{NAME}-headers')
    docs_info = get_info(f'{NAME}-docs')

    template = Template(Path('PKGBUILD.template').read_text())

    kernver, zenver = kern_info['pkgver'].rsplit('.', 1)
    pkgrel = kern_info['pkgrel']
    padded_kernver = kernver if len(kernver.split('.')) == 3 else kernver + '.0'

    pkgbuild = template.substitute(
        PKGVER=kern_info['pkgver'],
        KERNVER=kernver,
        ZENVER=zenver,
        PKGREL=pkgrel,
        KERNNAME=f"{padded_kernver}-{zenver}-{pkgrel}-zen",
        URL=kern_info['url'],
        KERN_PKGDESC=kern_info['pkgdesc'],
        KERN_DEPENDS=arr("depends", kern_info['depends']),
        KERN_CONFLICTS=arr("conflicts", kern_info['conflicts'] + ['"${_pkgname}"']),
        KERN_OPTDEPENDS=arr("optdepends", kern_info['optdepends']),
        KERN_PROVIDES=arr("provides", kern_info['provides']),
        KERN_REPLACES=arr("replaces", kern_info['replaces']),
        HEADERS_PKGDESC=headers_info['pkgdesc'],
        HEADERS_DEPENDS=arr("depends", headers_info['depends']),
        HEADERS_CONFLICTS=arr(
            "conflicts", headers_info['conflicts'] + ['"${_pkgname}-headers"']
        ),
        HEADERS_OPTDEPENDS=arr("optdepends", headers_info['optdepends']),
        HEADERS_PROVIDES=arr("provides", headers_info['provides']),
        HEADERS_REPLACES=arr("replaces", headers_info['replaces']),
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
    Path('PKGBUILD').write_text(pkgbuild + '\n')
    subprocess.check_call(['updpkgsums'])
    with open('.SRCINFO', 'w') as f:
        f.write(subprocess.check_output(['makepkg', '--printsrcinfo']).decode())
    subprocess.check_call(['git', 'add', 'PKGBUILD', '.SRCINFO'])
    subprocess.check_call(
        ['git', 'commit', '-m', f"{kern_info['pkgver']}-{kern_info['pkgrel']}"]
    )
    subprocess.check_call(['git', 'push'])

if __name__ == '__main__':
    current_version = get_current()
    latest_version = get_latest()
    if current_version != latest_version:
        info = get_info(NAME)
        archlinux_dot_org_version = f"{info['pkgver']}-{info['pkgrel']}"
        if archlinux_dot_org_version == latest_version:
            print(f"{NAME}-versioned-bin is out of date!")
            update()
        else:
            print(f"{NAME}-versioned-bin is out of date, but not yet on archlinux.org")
    else:
        print(f"{NAME}-versioned-bin is up to date")
