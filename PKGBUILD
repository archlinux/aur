# Maintainer: Ramana Kumar <first.last@gmail.com>
pkgname=petite-chez-scheme
pkgver=8.4
pkgrel=1
epoch=
pkgdesc="High-speed Scheme interpreter (non-threaded version)"
arch=('x86_64')
url="http://scheme.com/petitechezscheme.html"
license=('custom')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://scheme.com/download/pcsv$pkgver-a6le.tar.gz")
noextract=()
md5sums=('fc6729407dc9c4eca7903b890e26ae29')

build() {
  cd "$srcdir/csv$pkgver/custom"
  ./configure --temproot=$pkgdir
}

package() {
  cd "$srcdir/csv$pkgver/custom"
  make install
}

# vim:set ts=2 sw=2 et:
