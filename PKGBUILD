# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=texel
pkgver=1.05
pkgrel=1
pkgdesc="A free UCI compliant open source chess engine developed by Peter Österlund"
arch=('i686' 'x86_64')
url="http://chessprogramming.wikispaces.com/Texel"
license=('GPL')
source=("http://dl.dropboxusercontent.com/u/89684995/texel105.7z")
md5sums=('c592fa07caceacfce371800e76b54772')

build() {
	cd "${srcdir}/"
	make
}

package() {
	cd "${srcdir}/"
	install -Dm0755 $pkgname ${pkgdir}/usr/bin/$pkgname
}
