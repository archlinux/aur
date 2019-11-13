# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>

pkgname=mingw-w64-headers-bin
pkgver=7.0.0
pkgrel=1
pkgdesc="MinGW-w64 headers for Windows (pre-compiled)"
arch=('any')
url="http://mingw-w64.sourceforge.net"
license=('custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
provides=("mingw-w64-headers=${pkgver}")
conflicts=('mingw-w64-headers')
options=('!strip' '!libtool' '!emptydirs')
source=("https://sourceforge.net/projects/mingw-w64-builds/files/mingw-w64-headers/mingw-w64-headers-$pkgver.tar.xz")
md5sums=("d1aded01db1496781ed418d8f2a1e466")

package() {
  cd "mingw-w64-headers/"
	cp -r * "$pkgdir/"
}
