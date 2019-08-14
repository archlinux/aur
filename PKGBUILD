# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hponcfg
pkgver=5.4.0_0
pkgrel=1
pkgdesc="RILOE II/iLo online configuration utility"
arch=(x86_64)
url="https://downloads.linux.hpe.com/SDR/downloads/mcp"
depends=(libxslt)
groups=(hpproliant)
license=("CUSTOM")
source=("https://downloads.linux.hpe.com/SDR/downloads/mcp/centos/7/x86_64/current/$pkgname-${pkgver//_/-}.x86_64.rpm")
sha256sums=('577debf53e21dd9bb620c1e97be308a912a9a3acabdfff4f2c06a3438a34f515')

package() {
	cd "$srcdir"
	cp -a usr "$pkgdir"
	cp -a sbin "$pkgdir/usr/bin"

	cd "$pkgdir"/usr
	mv lib64 lib
}
