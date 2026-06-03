# Maintainer: quik belov0507artem@gmail.com
# Contributor: quik belov0507artem@gmail.com

pkgname=ot
pkgver=0.0.1
pkgrel=1
pkgdesc="program to print text from folder"
arch=('x86_64')
url="https://github.com/QUIK1001/ot"
license=('Unlicense')
depends=('gcc-libs')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/QUIK1001/ot/releases/download/ot-0.0.1/ot.tar.gz")
sha256sums=('62cb53b1b6429bfa3edae416724514405751b738b85679a392fb21056d554a59')

build() {
  cd "$srcdir"
  make MODE=release
}

package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
