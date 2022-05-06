# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hponcfg
pkgver=5.6.0_0
pkgrel=1
pkgdesc="RILOE II/iLo online configuration utility"
arch=(x86_64)
url="https://downloads.linux.hpe.com/SDR/downloads/mcp"
depends=(libxslt)
groups=(hpproliant)
license=("CUSTOM")
source=("https://downloads.linux.hpe.com/SDR/downloads/mcp/centos/8/x86_64/current/$pkgname-${pkgver//_/-}.x86_64.rpm")
sha256sums=('1cb0d04aba5504a35b5925e262bc0a5a9d7827d3f34075b7f8e9444a19d55f32')

package() {
	cd "$srcdir"
	cp -a usr "$pkgdir"
	cp -a sbin "$pkgdir/usr/bin"

	cd "$pkgdir"/usr
	mv lib64 lib
}
