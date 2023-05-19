# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=python-gettext
pkgver=5.0
pkgrel=1
pkgdesc="Python implementation of Gettext"
arch=('any')
url="https://pypi.org/project/python-gettext/"
license=('GPL3')
depends=(python)
makedepends=(python-setuptools)
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('869af1ea45e3dab6180557259824c2a62f1800e1286226af912431fe75c5084c')

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
