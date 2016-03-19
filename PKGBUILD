# Maintainer: Matthew Gamble

pkgname=pytg
pkgver=0.4.5
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
sha256sums=('36e58f8beba510d0dd6b44d5998f58c6edd7f1cc88e10bbd902bf8fa3f10f946')

package() {
    cd "pytg-$pkgver"
    python setup.py install --root="$pkgdir"
}
