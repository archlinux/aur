# Maintainer: Florijan Hamzic <fh@infinicode.de>

pkgname=python-crossbar
pkgver=0.15.0
pkgrel=1
pkgdesc="Crossbar.io - WAMP application router http://crossbar.io/"
arch=('any')
url="https://github.com/crossbario/crossbar"
license=('AGPL')
depends=('python>=3.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(https://github.com/crossbario/crossbar/archive/v${pkgver}.tar.gz)
sha1sums=('b2684bd09876a10addf4f527577b8f16d39a7620')

package(){
    cd "${srcdir}/crossbar-${pkgver}"
    python setup.py install --root="$pkgdir" --prefix=/usr
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

