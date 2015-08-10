# Maintainer: Matthew Gamble

pkgname=python-idiotscript
pkgver=1.1.1
pkgrel=1
pkgdesc="An easier, less powerful alternative to regular expressions"
arch=('any')
url='https://github.com/djmattyg007/IdiotScript'
license=('UNLICENSE')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/djmattyg007/IdiotScript/archive/$pkgver.zip")
sha256sums=("c92ebfab3e3259eecafa0e3109b72fe7e713ab1dbae098175e72a923d439ae76")

package() {
    cd "IdiotScript-$pkgver"
    python setup.py install --root="$pkgdir"
}
