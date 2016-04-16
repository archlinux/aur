# Maintainer: Matthew Gamble

pkgname=pytg
pkgver=0.4.10
pkgrel=1
pkgdesc="Connect to the Telegram CLI, receive and send Telegram messages."
arch=('any')
url="https://pypi.python.org/pypi/pytg/${pkgver}"
license=('GPL')
depends=('python' 'telegram-cli' 'python-dictobject' 'python-luckydonald-utils>=0.17')
makedepends=('python-setuptools')
source=(
    "https://pypi.python.org/packages/source/p/pytg/pytg-${pkgver}.tar.gz"
)
sha256sums=('ec73278d17a2c4c4172aa155cf57c0d506e5318524f6423ab2b8362f71ff6ea5')

package() {
    cd "pytg-$pkgver"
    python setup.py install --root="$pkgdir"
}
