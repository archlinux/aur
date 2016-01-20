# Maintainer: Oden <ops991923 [at] gmail [dot] com>
pkgname=gort
pkgver=0.4.1
pkgrel=1
pkgdesc="Command Line Toolkit for RobotOps."
arch=("i686" "x86_64")
url="http://gort.io"
license=("Apache")
depends=("bluez")
source_i686=("https://s3.amazonaws.com/gort-io/$pkgver/gort_${pkgver}_linux_386.tar.gz")
source_x86_64=("https://s3.amazonaws.com/gort-io/$pkgver/gort_${pkgver}_linux_amd64.tar.gz")
# update with updpkgsums
md5sums_i686=('6c1eea5204188ded205d4d652079b00e')
md5sums_x86_64=('567abcd97a91f72d67aeb4791e6b6775')

package() {
	cd ${pkgname}_${pkgver}_*

	mkdir -p $pkgdir/usr/bin
	mv ./gort $pkgdir/usr/bin/
}
