# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>

pkgname=mingw-w64-binutils-bin
pkgver=2.30
pkgrel=2
pkgdesc="Cross binutils for the MinGW-w64 cross-compiler (pre-compiled)"
arch=('x86_64')
url="http://www.gnu.org/software/binutils"
license=('GPL')
groups=('mingw-w64-toolchain' 'mingw-w64')
depends=('zlib')
provides=("mingw-w64-binutils=${pkgver}")
conflicts=('mingw-w64-binutils')
options=('!libtool' '!emptydirs')
source=("https://github.com/4shadoww/mingw-w64-builds/releases/download/binary/mingw-w64-binutils-$pkgver.tar.xz")
md5sums=('617474998f1ff23816f9555ebdaeb88e')

package() {
  cd "mingw-w64-binutils/"
	cp -r * "$pkgdir/"
}
