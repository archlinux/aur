import subprocess
import json
import sys

# Script to update the PKGBUILD to the latest [core]/linux

url = "https://www.archlinux.org/packages/core/x86_64/linux-lts/json/"

data = subprocess.check_output(['curl', '-s', url]).decode()
info = json.loads(data)
latest_kernver, latest_archver = info['pkgver'].rsplit('.', 1)
latest_pkgrel = info['pkgrel']

kernver, archver, pkgrel = subprocess.check_output(
    ['bash', '-c', 'source PKGBUILD; echo ${_kernver} ${_archver} ${_pkgrel}']
).decode('utf8').strip().split()

if (kernver, archver, pkgrel) != (latest_kernver, latest_archver, latest_pkgrel):
    print("linux-lts-versioned-bin out of date!")
    with open('PKGBUILD') as f:
        pkgbuild = f.read()

    replacements = (
        (f'_kernver={kernver}', f'_kernver={latest_kernver}'),
        (f'_archver={archver}', f'_archver={latest_archver}'),
        (f'_pkgrel={pkgrel}', f'_pkgrel={latest_pkgrel}'),
        (
            f'{kernver}.{archver}-{pkgrel}',
            f'{latest_kernver}.{latest_archver}-{latest_pkgrel}',
        ),
    )

    for a, b in replacements:
        pkgbuild = pkgbuild.replace(a, b)

    with open('PKGBUILD', 'w') as f:
        f.write(pkgbuild)

    subprocess.check_call(['updpkgsums'])

    with open('.SRCINFO', 'w') as f:
        f.write(subprocess.check_output(['makepkg', '--printsrcinfo']).decode())

    subprocess.check_call(['git', 'add', 'PKGBUILD', '.SRCINFO'])
    subprocess.check_call(
        ['git', 'commit', '-m', f'{latest_kernver}.{latest_archver}-{latest_pkgrel}']
    )

    def yn_choice(message, default='y'):
        try:
            choices = 'Y/n' if default.lower() in ('y', 'yes') else 'y/N'
            choice = input("%s\n(%s): " % (message, choices))
            values = ('y', 'yes', '') if default == 'y' else ('y', 'yes')
            return choice.strip().lower() in values
        except (KeyboardInterrupt, EOFError):
            sys.exit(1)

    if yn_choice('git push?'):
        subprocess.check_call(['git', 'push'])
else:
    print("linux-lts-versioned-bin is up to date")