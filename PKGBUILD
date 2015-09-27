# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=pass-git-helper
pkgver=0.1
pkgrel=1
pkgdesc="A git credential helper interfacing with pass, the standard unix password manager"
arch=(any)
url="https://github.com/languitar/pass-git-helper"
license=('LGPL3')
depends=('python3' 'pass')
makedepends=('git' 'python-setuptools')
source=("https://github.com/languitar/pass-git-helper/archive/release-${pkgver}.tar.gz")
md5sums=('79919c2710f5a527bd97dfe04ce4dce3')

package() {
    cd "pass-git-helper-release-${pkgver}"
    python3 setup.py install --root="$pkgdir/"
}
