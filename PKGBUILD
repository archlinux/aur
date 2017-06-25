_pkgname=nuvolasdk
pkgname=python-${_pkgname}
pkgver=4.4.0
pkgrel=1
pkgdesc="SDK for building Nuvola Player's web app scripts"
url="https://github.com/tiliado/nuvolasdk"
depends=(python python-pip)
optdepends=()
license=(BSD)
arch=(any)
source=(https://github.com/tiliado/nuvolasdk/archive/4.4.0.tar.gz)
md5sums=('f5395bdbb3fb668b95a9355ed41e5e77')


build() {
    cd "$srcdir/${_pkgname}-$pkgver"
   python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
