# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>

pkgname=mingw-w64-headers-bin
pkgver=5.0.3
pkgrel=3
pkgdesc="MinGW-w64 headers for Windows (pre-compiled)"
arch=('any')
url="http://mingw-w64.sourceforge.net"
license=('custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
provides=("mingw-w64-headers=${pkgver}")
conflicts=('mingw-w64-headers')
options=('!strip' '!libtool' '!emptydirs')
source=("https://github.com/4shadoww/mingw-w64-builds/releases/download/binary/mingw-w64-headers-$pkgver-2.tar.xz")
md5sums=("f792f12e98c607664e72a4287328cb0b")

package() {
  cd "mingw-w64-headers/"
	cp -r * "$pkgdir/"
}
