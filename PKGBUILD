# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>

pkgname=mingw-w64-crt-bin
pkgver=5.0.4
pkgrel=1
pkgdesc="MinGW-w64 CRT for Windows (pre-compiled)"
arch=('any')
url="http://mingw-w64.sourceforge.net"
license=('custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
provides=("mingw-w64-crt=${pkgver}")
conflicts=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
source=("https://sourceforge.net/projects/mingw-w64-builds/files/mingw-w64-crt/mingw-w64-crt-$pkgver.tar.xz")
md5sums=('4de7e73500e2db8979afeb84bb2b5c73')

package() {
  cd "mingw-w64-crt/"
	cp -r * "$pkgdir/"
}
