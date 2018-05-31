# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>

pkgname=mingw-w64-crt-bin
pkgver=5.0.3
pkgrel=2
pkgdesc="MinGW-w64 CRT for Windows (pre-compiled)"
arch=('any')
url="http://mingw-w64.sourceforge.net"
license=('custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
provides=("mingw-w64-crt=${pkgver}")
conflicts=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
source=("https://github.com/4shadoww/mingw-w64-builds/releases/download/binary/mingw-w64-crt-$pkgver.tar.xz")
md5sums=('efa29e4e1b8af1acd794d491116caad3')

package() {
  cd "mingw-w64-crt/"
	cp -r * "$pkgdir/"
}
