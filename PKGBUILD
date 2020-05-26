# Maintainer: Your Name <youremail@domain.com>
pkgname=mpv-quack
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="mpv script for temporarily reducing audio volume after seeking"
arch=('any')
url="https://github.com/CounterPillow/mpv-quack"
license=('GPL3')
groups=()
depends=('mpv')
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
source=("git+https://github.com/CounterPillow/mpv-quack")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"
  install -D -m644 quack.lua "${pkgdir}/usr/share/mpv/scripts/quack.lua" 
}
