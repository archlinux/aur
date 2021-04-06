# Maintainer: LiveEmily <emily@liveemily.com>
pkgname=nextpad-git
pkgver=0.0.r8.5440ee1
pkgrel=1
epoch=
pkgdesc="Not so powerful text editor I'm working on, inspired by vim and nano."
arch=(x86_64)
url="https://github.com/LiveEmily/nextpad.git"
license=('GPL')
groups=()
depends=()
makedepends=(git gcc)
checkdepends=()
optdepends=()
provides=(nextpad)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd nextpad
	make
}

package() {
	cd ~/nextpad-git/src/nextpad/
	sudo install -Dm 0755 -t /usr/bin/ nextpad
}
