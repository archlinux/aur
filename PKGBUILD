# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hp-smh-templates
pkgver=10.3.0_1447.15
pkgrel=1
pkgdesc="HP System Management Homepage Templates"
arch=(any)
url="http://downloads.linux.hpe.com/SDR/downloads/mcp"
depends=(bash hpsmh hp-snmp-agents)
groups=(hpproliant)
license=("CUSTOM")

source=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/7/x86_64/current/${pkgname}-${pkgver//_/-}.noarch.rpm")
sha256sums=('1cb04e5040348919ad5476770ed85a63c6420db9eaa30de68c7ae8c843cfca83')

package() {
	cp -a "$srcdir/"{opt,usr} "$pkgdir"
}
