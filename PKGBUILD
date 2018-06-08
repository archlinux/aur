# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hponcfg
pkgver=5.1.0_0
pkgrel=1
pkgdesc="RILOE II/iLo online configuration utility"
arch=(x86_64)
url="http://downloads.linux.hpe.com/SDR/downloads/mcp"
depends=(libxslt)
groups=(hpproliant)
license=("CUSTOM")
source=("https://downloads.linux.hpe.com/SDR/downloads/mcp/centos/7/x86_64/current/$pkgname-${pkgver//_/-}.x86_64.rpm")
sha256sums=('b9da3d52b648a449964dce3f492d1aaf5592ae3df01909197a4586e01ea472ae')

package() {
	cd "$srcdir"
	cp -a usr "$pkgdir"
	cp -a sbin "$pkgdir/usr/bin"

	cd "$pkgdir"/usr
	mv lib64 lib
}
