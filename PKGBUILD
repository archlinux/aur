# Maintainer: Gabe Conradi <gabe.conradi+aur@gmail.com>

pkgname='tumblrtv-xscreensaver'
pkgver=0.1.3
pkgrel=1
epoch=
pkgdesc="Tumblr TV screensaver"
arch=('i686' 'x86_64')
url="https://github.com/byxorna/tumblrtv-xscreensaver"
license=('Apache 2.0')
groups=('screensaver')
depends=('webkitgtk2' 'gtk2' 'xscreensaver')
makedepends=('webkitgtk2' 'gtk2')
checkdepends=()
optdepends=('xscreensaver: to use tumblrtv with xscreensaver')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/byxorna/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
sha1sums=('58a515b5ab4f86a0cb93cd551f56d05980b0d5a6')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

check() {
  echo ""
}

package() {
	cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
