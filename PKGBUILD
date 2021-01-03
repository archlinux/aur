# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=pass-git-helper
pkgver=1.1.1
pkgrel=1
pkgdesc="A git credential helper interfacing with pass, the standard unix password manager"
arch=(any)
url="https://github.com/languitar/pass-git-helper"
license=('LGPL3')
depends=('python3' 'python-setuptools' 'pass' 'python-xdg')
makedepends=('git')
source=("https://github.com/languitar/pass-git-helper/archive/v${pkgver}.tar.gz")
md5sums=('0bc22ad7443e085c34d9bee130d9592a')

package() {
    cd "pass-git-helper-${pkgver}"
    python3 setup.py install --root="$pkgdir/"
}
