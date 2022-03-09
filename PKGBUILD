# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=pass-git-helper
pkgver=1.2.0
pkgrel=1
pkgdesc="A git credential helper interfacing with pass, the standard unix password manager"
arch=(any)
url="https://github.com/languitar/pass-git-helper"
license=('LGPL3')
depends=('python3' 'pass' 'python-xdg')
makedepends=('git' 'python-setuptools')
source=("https://github.com/languitar/pass-git-helper/archive/v${pkgver}.tar.gz")
sha256sums=('d9ab12d81e283411a65285a0030cbfef2548dc580631d2337628e57f10e463aa')

package() {
    cd "pass-git-helper-${pkgver}"
    python3 setup.py install --root="$pkgdir/"
}
