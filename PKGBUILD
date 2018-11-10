# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=pass-git-helper
pkgver=1.0.0
pkgrel=1
pkgdesc="A git credential helper interfacing with pass, the standard unix password manager"
arch=(any)
url="https://github.com/languitar/pass-git-helper"
license=('LGPL3')
depends=('python3' 'pass' 'python-xdg')
makedepends=('git' 'python-setuptools')
source=("https://github.com/languitar/pass-git-helper/archive/v${pkgver}.tar.gz")
md5sums=('940ced4c2eafb23bf1a8387a61de7ced')

package() {
    cd "pass-git-helper-${pkgver}"
    python3 setup.py install --root="$pkgdir/"
}
