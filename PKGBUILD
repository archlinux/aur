# Maintainer : Breizh <breizh.craft.98@openmailbox.org>
pkgname=p7
pkgver=1.2
pkgrel=1
pkgdesc="Transfer files in and out of your CASIO fx calculator through USB"
arch=('i686' 'x86_64')
url="https://forge.touhey.fr/casio/software/p7/"
license=('GPL2')
groups=()
depends=('libusb' 'libp7>=1.3-1')
makedepends=('make' 'asciidoc' 'gzip')
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
md5sums=('fa8a1fa30d8fd5d36c9b52ffff499f1a')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=$pkgdir/usr
  make all all-doc
}

package() {
  cd "$pkgname-$pkgver"

  make install install-doc
}
