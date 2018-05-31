# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>

pkgname=mingw-w64-gcc-bin
pkgver=8.1.0
pkgrel=2
pkgdesc="Cross GCC for the MinGW-w64 cross-compiler (pre-compiled)"
arch=('x86_64')
url="https://gcc.gnu.org/"
license=('GPL')
groups=('mingw-w64-toolchain' 'mingw-w64')
depends=('zlib' 'libmpc' 'mingw-w64-crt' 'mingw-w64-binutils' 'mingw-w64-winpthreads' 'mingw-w64-headers')
provides=("mingw-w64-gcc=${pkgver}")
conflicts=('mingw-w64-gcc')
options=('!strip' 'staticlibs' '!emptydirs' '!buildflags')
source=("https://github.com/4shadoww/mingw-w64-builds/releases/download/binary/mingw-w64-gcc-$pkgver.tar.xz")
md5sums=('c00757961e4e151330f8b5afbf7716cc')

package() {
	cd "mingw-w64-gcc/"
	cp -r * "$pkgdir/"
}
