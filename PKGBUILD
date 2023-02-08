# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=sanjuuni
pkgver=0.3
pkgrel=2
epoch=
pkgdesc="Converts images and videos into a format that can be displayed in ComputerCraft."
arch=('x86_64' 'i386' 'armv7l' 'armv7h' 'aarch64' 'powerpc' 'ppc64el' 's390x' 'riscv64' 'riscv32')
url="https://github.com/MCJack123/sanjuuni"
license=('GPL')
groups=()
depends=('ffmpeg' 'poco' 'zlib')
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
source=("https://github.com/MCJack123/sanjuuni/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('bee5f95cde853a95e9caea3153cdd2bf7c731f7247ff15064b83044a0a0e3aba')
validpgpkeys=()

prepare() {
	true
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	true
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m 0755 sanjuuni "$pkgdir/usr/bin/sanjuuni"
}
