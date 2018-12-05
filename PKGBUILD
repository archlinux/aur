# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=compiledb
pkgver=0.9.8
pkgrel=1
pkgdesc="Tool for generating Clang's JSON Compilation Database file for GNU make-based build systems"
arch=('i686' 'x86_64')
url="https://github.com/nickdiego/compiledb-generator"
license=('GPL3')
depends=('python' 'python-click' 'python-bashlex')
makedepends=()
provides=()
conflicts=()
replaces=(compiledb-generator)
backup=()
options=(!emptydirs)
install=
source=(${url}/archive/v${pkgver}.tar.gz)
md5sums=('79a001db1b4a3c98e6ad12d8a6b43347')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
