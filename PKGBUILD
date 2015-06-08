# Maintainer: Your Name <youremail@domain.com>
pkgname=dislines
pkgver=1.6
pkgrel=1
pkgdesc="Distributes the lines of a tagged text into several files"
arch=('any')
url="http://www.danielclemente.com/dislines/"
license=('GPL')
groups=()
depends=('perl')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("http://www.danielclemente.com/dislines/$pkgname.pl")
md5sums=('bea155c8ef7b4a9c4b63c63acb809681')

build() {
  return 0
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin"
  install -m755 $pkgname.pl "$pkgdir/usr/bin/$pkgname"
}

