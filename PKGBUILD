# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=git-annex-remote-googledrive
pkgver=1.2.3
pkgrel=1
pkgdesc='Faster git-annex special remote for Google Drive with support for exports'
url='https://github.com/Lykos153/git-annex-remote-googledrive'
license=('GPLv3+')
arch=('any')
depends=('git-annex' 'python-annexremote' 'python-drivelib' 'python-tenacity' 'python-gitpython' 'python-humanfriendly')
makedepends=('python-setuptools' 'git')
source=("git+https://github.com/Lykos153/${pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')



package() {
    cd "${srcdir}/${pkgname}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
