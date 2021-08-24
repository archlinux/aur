# Maintaner: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-tox-poetry
_pkgname=tox-poetry
pkgver=0.3.0
pkgrel=1
pkgdesc="Tox poetry plugin"
url="https://github.com/tkukushkin/tox-poetry"
depends=('python-tox')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('1e892b124a4d16d0ab520c3336c7214f')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
