# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hpssacli
pkgver=2.30_6.0
pkgrel=1
pkgdesc="HP Command Line Smart Storage Administrator"
arch=(i686 x86_64)
url="http://downloads.linux.hpe.com/SDR/downloads/mcp"
depends=(bash)
replaces=(hpacucli)
groups=(hpproliant)
license=("CUSTOM")

source_i686=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/6/i686/current/$pkgname-${pkgver//_/-}.i386.rpm")
source_x86_64=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/7/x86_64/current/$pkgname-${pkgver//_/-}.x86_64.rpm")

sha256sums_i686=('2b25b8bf0ad69ac0b400a261dc256eced26a23a1bf838b4b65d3ce1530e9c3e0')
sha256sums_x86_64=('b2ab04ec5a605d32ef89da8891baacd89e6831e1afe7cf23434de81d9f6cb959')

package() {
	mv usr/{sbin,bin}
	cp -a opt usr "$pkgdir"
}
