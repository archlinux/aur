# Maintainer: Matthew Gamble

pkgname=pytg
pkgver=0.4.9
pkgrel=1
pkgdesc="Connect to the Telegram CLI, receive and send Telegram messages."
arch=('any')
url="https://pypi.python.org/pypi/pytg/${pkgver}"
license=('GPL')
depends=('python' 'python-dictobject' 'python-luckydonald-utils>=0.17')
makedepends=('python-setuptools')
source=(
    "https://pypi.python.org/packages/source/p/pytg/pytg-${pkgver}.tar.gz"
)
sha256sums=('b0c3f33a1a90b5bc2252a05f3fed34e53001ac9ac647f24a1e13306307d2f84d')

package() {
    cd "pytg-$pkgver"
    python setup.py install --root="$pkgdir"
}
