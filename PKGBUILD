# Maintainer: Oden <ops991923 [at] gmail [dot] com>
pkgname=gort
pkgver=0.9.0
pkgrel=3
pkgdesc="Command Line Toolkit for RobotOps."
arch=("i686" "x86_64" "arm")
url="http://gort.io"
license=("Apache")
depends=("bluez")
source_i686=("https://github.com/hybridgroup/gort/releases/download/v${pkgver}/gort_${pkgver}_linux_386.tar.gz")
source_x86_64=("https://github.com/hybridgroup/gort/releases/download/v${pkgver}/gort_${pkgver}_linux_amd64.tar.gz")
source_arm=("https://github.com/hybridgroup/gort/releases/download/v${pkgver}/gort_${pkgver}_linux_arm.tar.gz")
# update with updpkgsums
md5sums_i686=('d3a22208c7bc1fea8ff12f66e4e8935e')
md5sums_x86_64=('f79015e1577abbb45feb36f53be9268e')
md5sums_arm=('26fb4e0126763784bafa708c2c77c641')

package() {
	cd $(find . -type d -name "gort*")

	mkdir -p $pkgdir/usr/bin
	mv ./gort $pkgdir/usr/bin/
}
