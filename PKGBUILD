# Maintainer : Breizh <breizh.craft.98@openmailbox.org>
pkgname=libp7
pkgver=1.5
pkgrel=1
pkgdesc="Casio Communication Protocol 7.00 implementation"
arch=('i686' 'x86_64')
url="https://p7.touhey.fr"
license=('GPL2')
groups=()
depends=('libusb')
makedepends=('make' 'gcc' 'asciidoc' 'gzip' 'binutils')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://forge.touhey.fr/lib/$pkgname/snapshot/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('bb71c2fa64298db8e203d668d9512fc0')

build() {
  cd "$pkgname-$pkgver"

  ./configure --root=$pkgdir
  make
}

package() {
  cd "$pkgname-$pkgver"

  make install
}
