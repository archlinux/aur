# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hponcfg
pkgver=5.3.0_0
pkgrel=1
pkgdesc="RILOE II/iLo online configuration utility"
arch=(x86_64)
url="https://downloads.linux.hpe.com/SDR/downloads/mcp"
depends=(libxslt)
groups=(hpproliant)
license=("CUSTOM")
source=("https://downloads.linux.hpe.com/SDR/downloads/mcp/centos/7/x86_64/current/$pkgname-${pkgver//_/-}.x86_64.rpm")
sha256sums=('eed1cbf5e30f7ed9c84bb6509458f2875c2a4b6b2b2136fbe274c800f099cd7b')

package() {
	cd "$srcdir"
	cp -a usr "$pkgdir"
	cp -a sbin "$pkgdir/usr/bin"

	cd "$pkgdir"/usr
	mv lib64 lib
}
