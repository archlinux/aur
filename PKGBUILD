# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>

pkgname=mingw-w64-gcc-bin
pkgver=7.3.0
pkgrel=1
pkgdesc="Cross GCC for the MinGW-w64 cross-compiler (pre-compiled)"
arch=('x86_64')
url="https://gcc.gnu.org/"
license=('GPL')
groups=('mingw-w64-toolchain' 'mingw-w64')
depends=('zlib' 'libmpc' 'mingw-w64-crt' 'mingw-w64-binutils' 'mingw-w64-winpthreads' 'mingw-w64-headers')
provides=('mingw-w64-gcc')
conflicts=('mingw-w64-gcc')
options=('!strip' 'staticlibs' '!emptydirs' '!buildflags')
source=("https://github.com/4shadoww/mingw-w64-builds/releases/download/binary/$provides-$pkgver.tar.xz")
md5sums=('965c28aee8cdda8b5933c5d2d0319c29')

package() {
	cd "$provides/"
	cp -r * "$pkgdir/"
}
