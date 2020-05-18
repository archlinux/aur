# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>

pkgname=mingw-w64-winpthreads-bin
pkgver=7.0.0
pkgrel=2
pkgdesc="MinGW-w64 winpthreads library (pre-compiled)"
arch=('any')
url="http://mingw-w64.sourceforge.net"
license=('custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
provides=('mingw-w64-winpthreads=${pkgver}' 'mingw-w64-headers-bootstrap')
conflicts=('mingw-w64-winpthreads' 'mingw-w64-headers-bootstrap')
replaces=('mingw-w64-headers-bootstrap')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
source=("https://sourceforge.net/projects/mingw-w64-builds/files/mingw-w64-winpthreads/mingw-w64-winpthreads-$pkgver-2.tar.xz")
md5sums=("f414ec5dbb8a7ea5424fd4f021a68095")

package() {
  cd "mingw-w64-winpthreads/"
	cp -r * "$pkgdir/"
}
