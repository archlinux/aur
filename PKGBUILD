# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=pass-git-helper
pkgver=1.3.0
pkgrel=1
pkgdesc="A git credential helper interfacing with pass, the standard unix password manager"
arch=(any)
url="https://github.com/languitar/pass-git-helper"
license=('LGPL3')
depends=('python3' 'pass' 'python-xdg')
makedepends=('git' 'python-setuptools')
source=("https://github.com/languitar/pass-git-helper/archive/v${pkgver}.tar.gz")
sha256sums=('9600bba2e7ac389a45a8222478c4fb2a4b1722682868df7dc7daa991828d851c')

package() {
    cd "pass-git-helper-${pkgver}"
    python3 setup.py install --root="$pkgdir/"
}
