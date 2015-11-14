# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=pass-git-helper
pkgver=0.2
pkgrel=2
pkgdesc="A git credential helper interfacing with pass, the standard unix password manager"
arch=(any)
url="https://github.com/languitar/pass-git-helper"
license=('LGPL3')
depends=('python3' 'pass' 'python-xdg')
makedepends=('git' 'python-setuptools')
source=("https://github.com/languitar/pass-git-helper/archive/release-${pkgver}.tar.gz")
md5sums=('294b64e677729878ff3d0d0f2928581b')

package() {
    cd "pass-git-helper-release-${pkgver}"
    python3 setup.py install --root="$pkgdir/"
}
