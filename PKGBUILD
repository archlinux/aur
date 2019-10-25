# Maintainer: Your Name <youremail@domain.com>
pkgname=mpv-visualizer
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Various audio visualization."
arch=('any')
url="https://github.com/mfcc64/mpv-scripts"
license=('unknown')
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
source=("mpv-visualizer::git+https://github.com/mfcc64/mpv-scripts")
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
  install -D -m644 visualizer.lua "${pkgdir}/usr/share/mpv/scripts/visualizer.lua" 
}
