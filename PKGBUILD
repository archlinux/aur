# Maintainer: Lonny Wong <lonnywong@qq.com>
pkgname="trzsz"
pkgver="1.0.0"
pkgrel=1
epoch=0
pkgdesc="Simple file transfer tools, similar to lrzsz (rz/sz), and compatible with tmux."
arch=("x86_64" "i686" "aarch64")
url="https://trzsz.github.io/"
license=("MIT")
groups=()
depends=()
makedepends=("go>=1.18.0")
checkdepends=()
optdepends=()
provides=("trz" "tsz" "trzsz")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/trzsz/trzsz-go/archive/refs/tags/v1.0.0.1.tar.gz")
noextract=()
md5sums=('317ecd4d0eea50110a1793214b52577d')
validpgpkeys=()

build() {
	cd "trzsz-go-1.0.0.1"
	make
}

package() {
	cd "trzsz-go-1.0.0.1"
	make DESTDIR="$pkgdir" install
}
