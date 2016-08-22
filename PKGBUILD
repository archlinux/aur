# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hp-smh-templates
pkgver=10.4.0_1455.24
pkgrel=1
pkgdesc="HP System Management Homepage Templates"
arch=(any)
url="http://downloads.linux.hpe.com/SDR/downloads/mcp"
depends=(bash hpsmh hp-snmp-agents)
groups=(hpproliant)
license=("CUSTOM")

source=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/7/x86_64/current/${pkgname}-${pkgver//_/-}.noarch.rpm")
sha256sums=('7d479a66b6a5d7395cf0dac4f94a0cb3c551f6c5759b0207b24a783d478464d5')

package() {
	cp -a "$srcdir/"{opt,usr} "$pkgdir"
}
