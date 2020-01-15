# Maintainer: Chris Brendel <cdbrendel@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>
pkgname=python-catalogue
_origpkgname=catalogue
pkgver=2.0.0
pkgrel=1
pkgdesc="Super lightweight function registries for your library "
arch=("x86_64")
url="https://github.com/explosion/catalogue"
license=("MIT")
depends=("python>=3.6")
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/catalogue/archive/v$pkgver.tar.gz")
md5sums=('e9e14d6aab9dad97770a8c1285f78400')

package() {
    cd "$_origpkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}
