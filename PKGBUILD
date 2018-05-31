# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>

pkgname=mingw-w64-winpthreads-bin
pkgver=5.0.3
pkgrel=2
pkgdesc="MinGW-w64 winpthreads library (pre-compiled)"
arch=('any')
url="http://mingw-w64.sourceforge.net"
license=('custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
provides=("mingw-w64-winpthreads=${pkgver}")
conflicts=('mingw-w64-winpthreads')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
source=("https://github.com/4shadoww/mingw-w64-builds/releases/download/binary/mingw-w64-winpthreads-$pkgver.tar.xz")
md5sums=("2088b38c5194bdda533a88dc6a214cdb")

package() {
  cd "mingw-w64-winpthreads/"
	cp -r * "$pkgdir/"
}
