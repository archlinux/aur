# Maintainer: Lukas Spiss <lukas.spiss@outlook.de>

pkgname=howdy-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="Windows Hello™ style facial authentication for Linux"
arch=('x86_64')
url="https://github.com/boltgolt/howdy"
license=('MIT')
groups=('base-devel')
depends=()
source=(https://github.com/boltgolt/howdy/releases/download/v${pkgver}/howdy_${pkgver}.deb)
md5sums=('06e40cb2509db50c62924eb59f64e256')

package() {
   	cd "$srcdir/"
	tar -xf data.tar.xz -C "${pkgdir}"
}
