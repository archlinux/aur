# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>

pkgname=mingw-w64-headers-bin
pkgver=5.0.4
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
md5sums=("fd196dfd9b3da6dc3476d4e7b29c057a")

package() {
  cd "mingw-w64-headers/"
	cp -r * "$pkgdir/"
}
