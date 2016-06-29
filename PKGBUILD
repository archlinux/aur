# Maintainer: Faerbit <faerbit at gmail dot com>

pkgname="python-dnspython3"
_pkgname="dnspython3"
pkgver=1.12.0
pkgrel=1
pkgdesc="DNS toolkit for python 3.x"
arch=('any')
url="http://www.dnspython.org"
license=('MIT')
depends=('python-setuptools')
source=("http://www.dnspython.org/kits3/${pkgver}/dnspython3-${pkgver}.zip")
sha256sums=('e9630946207864c7a780798809cd2ec9c6bbde6ac88b97a2fda66f018eec1c8d')

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python3 setup.py install --root="$pkgdir/" --optimize=1

    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
