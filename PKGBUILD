# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=pass-git-helper
pkgver=0.3
pkgrel=1
pkgdesc="A git credential helper interfacing with pass, the standard unix password manager"
arch=(any)
url="https://github.com/languitar/pass-git-helper"
license=('LGPL3')
depends=('python3' 'pass' 'python-xdg')
makedepends=('git' 'python-setuptools')
source=("https://github.com/languitar/pass-git-helper/archive/release-${pkgver}.tar.gz")
md5sums=('adb3a075255af6bfdc9839a15e0e63e8')

package() {
    cd "pass-git-helper-release-${pkgver}"
    python3 setup.py install --root="$pkgdir/"
}
