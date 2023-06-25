# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=sanjuuni
pkgver=0.4
pkgrel=1
epoch=
pkgdesc="Converts images and videos into a format that can be displayed in ComputerCraft."
arch=('x86_64' 'i386' 'armv7l' 'armv7h' 'aarch64' 'powerpc' 'ppc64el' 's390x' 'riscv64' 'riscv32')
url="https://github.com/MCJack123/sanjuuni"
license=('GPL')
groups=()
depends=('ffmpeg' 'poco' 'zlib')
makedepends=()
checkdepends=()
optdepends=('ocl-icd: OpenCL GPU support' 'opencl-clhpp: OpenCL GPU support')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/MCJack123/sanjuuni/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('6ac8dcba831ad88a5f8600d7dcf7552813e7cb8c9fb0b7f1db5fcdf21fd3232a')
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
