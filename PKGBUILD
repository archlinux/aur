# Maintainer: Matthew Gamble

pkgname=python-webpagecache
pkgver=1.0.0
pkgrel=1
pkgdesc="A utility class for downloading webpages and storing them in an SQLite3 database as a cache."
arch=('any')
url='https://github.com/djmattyg007/python-webpagecache'
license=('UNLICENSE')
depends=('python' 'python-wire')
makedepends=('python-setuptools')
source=("https://github.com/djmattyg007/python-webpagecache/archive/${pkgver}.zip")
sha256sums=('53803a864b529b7b82ee3a92f4bab0bb1a706d086a3fc06a763b0bdda2b01b48')

package() {
    cd "python-webpagecache-$pkgver"
    python setup.py install --root="$pkgdir"
}
