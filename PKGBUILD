# Maintainer: Chris Brendel <cdbrendel@gmail.com>
pkgname=python-confection
_origpkgname=confection
pkgver=0.0.4
pkgrel=1
pkgdesc="The sweetest config system for Python"
arch=("x86_64")
url="https://github.com/explosion/confection"
license=("MIT")
depends=("python" "python-pydantic" "python-typing_extensions" "python-srsly")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/confection/archive/v$pkgver.tar.gz")
md5sums=('92642f2d414efc140d7651693e4c5416')

package() {
    cd "$_origpkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}
