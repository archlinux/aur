# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hponcfg
pkgver=5.5.0_0
pkgrel=1
pkgdesc="RILOE II/iLo online configuration utility"
arch=(x86_64)
url="https://downloads.linux.hpe.com/SDR/downloads/mcp"
depends=(libxslt)
groups=(hpproliant)
license=("CUSTOM")
source=("https://downloads.linux.hpe.com/SDR/downloads/mcp/centos/8/x86_64/current/$pkgname-${pkgver//_/-}.x86_64.rpm")
sha256sums=('e993841ed98a74bd3060b275a9b4f8449f38eaa0949c45254d29c41aa510d779')

package() {
	cd "$srcdir"
	cp -a usr "$pkgdir"
	cp -a sbin "$pkgdir/usr/bin"

	cd "$pkgdir"/usr
	mv lib64 lib
}
