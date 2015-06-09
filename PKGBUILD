# Maintainer: Oden <ops991923 [at] gmail [dot] com>
pkgname=gort
pkgver=0.3.0
pkgrel=1
pkgdesc="Command Line Toolkit for RobotOps."
arch=("i686" "x86_64")
url="http://gort.io"
license=("Apache")
depends=("bluez4")
source_i686=("https://s3.amazonaws.com/gort-io/$pkgver/gort_${pkgver}_linux_386.tar.gz")
source_x86_64=("https://s3.amazonaws.com/gort-io/$pkgver/gort_${pkgver}_linux_amd64.tar.gz")
# update with updpkgsums
md5sums_i686=('51b78d2ceed50b60a0ecce72c00339b0')
md5sums_x86_64=('2b49d11c6ebe3f9c42b7fda709876848')

package() {
	cd ${pkgname}_${pkgver}_*

	mkdir -p $pkgdir/usr/bin
	mv ./gort $pkgdir/usr/bin/
}
