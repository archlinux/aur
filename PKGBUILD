# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hpsmh
pkgver=7.5.0_4
pkgrel=1
pkgdesc="HP System Management Homepage"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/mcp"
depends=(glibc expat pam curl)
groups=(hpproliant)
license=("CUSTOM")
options=(!strip)

source_i686=("http://downloads.linux.hp.com/SDR/downloads/mcp/centos/6/i386/current/$pkgname-${pkgver//_/-}.i386.rpm")
source_x86_64=("http://downloads.linux.hp.com/SDR/downloads/mcp/centos/7/x86_64/current/$pkgname-${pkgver//_/-}.x86_64.rpm")

sha256sums_i686=('f5230d981fd7884de2c3beb57d5df8bc7b75e21415f75ab4912021f27c7f6cdd')
sha256sums_x86_64=('21ca5fee5162e713ebb4114e86ba1eb6f1808b1597185d72bcdd8d6f2062420b')

package() {
	cp -a "$srcdir/"{etc,opt,usr} "$pkgdir"
}
