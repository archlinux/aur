# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=pass-git-helper
pkgver=1.1.2
pkgrel=2
pkgdesc="A git credential helper interfacing with pass, the standard unix password manager"
arch=(any)
url="https://github.com/languitar/pass-git-helper"
license=('LGPL3')
depends=('python3' 'pass' 'python-xdg')
makedepends=('git' 'python-setuptools')
source=("https://github.com/languitar/pass-git-helper/archive/v${pkgver}.tar.gz")
sha256sums=('4acfb486d0873014376383167792ee2b46926386718eb2331a1b4564576a2076')

package() {
    cd "pass-git-helper-${pkgver}"
    python3 setup.py install --root="$pkgdir/"
}
