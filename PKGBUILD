# Maintainer : Breizh <breizh.craft.98@openmailbox.org>
pkgname=p7
pkgver=1.1
pkgrel=2
pkgdesc="Transfer files in and out of your CASIO fx calculator through USB"
arch=('i686' 'x86_64')
url="https://forge.touhey.fr/casio/software/p7/"
license=('GPL2')
groups=()
depends=('libusb' 'libp7')
makedepends=('make' 'clang' 'asciidoc' 'gzip')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://forge.touhey.fr/casio/software/$pkgname/snapshot/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('980e650f959454a159a93fcbb8025879')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=$pkgdir/usr
  make all all-doc
}

package() {
  cd "$pkgname-$pkgver"

  make install install-doc
}
