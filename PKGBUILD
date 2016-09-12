# Maintainer : Breizh <breizh.craft.98@openmailbox.org>
pkgname=p7screen
pkgver=1.0
pkgrel=1
pkgdesc="Display screen streaming ot of your CASIO fx calculator"
arch=('i686' 'x86_64')
url="https://p7.touhey.fr/"
license=('GPL2')
groups=()
depends=('libusb' 'libp7>=1.5-1' 'sdl>=1.2')
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
md5sums=('ffba290006e0d6277ddd0b74130fe0ce')

build() {
  cd "$pkgname-$pkgver"

  ./configure --root=$pkgdir
  make
}

package() {
  cd "$pkgname-$pkgver"

  make install
}
