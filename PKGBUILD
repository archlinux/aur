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
md5sums_i686=('3f2b94f7fac1ad611ac492956bf49cea')
md5sums_x86_64=('8d462a5b6c425064320223a88bc47812')
md5sums_arm=('d8b791b0717fbb18ef618ceed9f90ba7')

package() {
	cd $(find . -type d -name "gort*")

	mkdir -p $pkgdir/usr/bin
	mv ./gort $pkgdir/usr/bin/
}
