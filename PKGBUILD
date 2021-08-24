# Maintaner: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-tox-poetry
_pkgname=tox-poetry
pkgver=0.4.1
pkgrel=1
pkgdesc="Tox poetry plugin"
url="https://github.com/tkukushkin/tox-poetry"
depends=('python-tox')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('dc58c33a370264b825b1e7e6936cb43b')

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
