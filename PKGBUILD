# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>

pkgname=mingw-w64-winpthreads-bin
pkgver=5.0.4
pkgrel=1
pkgdesc="MinGW-w64 winpthreads library (pre-compiled)"
arch=('any')
url="http://mingw-w64.sourceforge.net"
license=('custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
provides=("mingw-w64-winpthreads=${pkgver}")
conflicts=('mingw-w64-winpthreads')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
source=("https://sourceforge.net/projects/mingw-w64-builds/files/mingw-w64-winpthreads/mingw-w64-winpthreads-$pkgver.tar.xz")
md5sums=("88e46fb422de3cca8a1c40d45462b9aa")

package() {
  cd "mingw-w64-winpthreads/"
	cp -r * "$pkgdir/"
}
