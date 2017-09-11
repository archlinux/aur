# Maintainer: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=expressions
pkgname=python-$_pkgname
pkgver=0.2.3
pkgrel=1
pkgdesc="Extensible arithmetic expression parser and compiler"
arch=("any")
url="https://github.com/DataBrewery/expressions"
license=("MIT")
depends=("python"
         "python-grako")
makedepends=("python-setuptools")
source=("https://github.com/databrewery/expressions/archive/v${pkgver}.tar.gz")
sha256sums=('9f683975345cd7481f98beedca4f953727d99924fbdd007c5b5c92ded0396218')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
