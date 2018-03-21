# Maintainer: Noa-Emil Nissinen <aur dot satella at spamgourmet dot org>

pkgname=mingw-w64-headers-bin
pkgver=5.0.3
pkgrel=1
pkgdesc="MinGW-w64 headers for Windows (pre-compiled)"
arch=('any')
url="http://mingw-w64.sourceforge.net"
license=('custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
provides=('mingw-w64-headers')
conflicts=('mingw-w64-headers')
options=('!strip' '!libtool' '!emptydirs')
source=("https://github.com/4shadoww/mingw-w64-builds/releases/download/binary/$provides-$pkgver.tar.xz")
md5sums=("b5881db21241e43420e4215201e31d0e")

package() {
  cd "$provides/"
	cp -r * "$pkgdir/"
}
