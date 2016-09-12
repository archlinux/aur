# Maintainer : Breizh <breizh.craft.98@openmailbox.org>
pkgname=p7
pkgver=1.4
pkgrel=1
pkgdesc="Transfer files in and out of your CASIO fx calculator through USB"
arch=('i686' 'x86_64')
url="https://p7.touhey.fr/"
license=('GPL2')
groups=()
depends=('libusb' 'libp7>=1.5-1')
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
md5sums=('554cb0d4a77a79d48c48fe797e5b2338')

build() {
  cd "$pkgname-$pkgver"

  ./configure --root=$pkgdir
  make
}

package() {
  cd "$pkgname-$pkgver"

  make install
}
