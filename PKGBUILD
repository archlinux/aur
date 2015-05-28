# Maintainer: Justin Dray <justin@dray.be>
pkgname=lsi-cfggen
pkgver=2.10.00
pkgrel=2
pkgdesc="LSI cfggen utility for 1064/1068 based LSI Fusion MPT SAS devices"
url="http://www.lsi.com"
arch=('x86_64' 'i686')
license=('none')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://copy.com/D1X42Cf78kCl/public/packages/ibm_utl_mptsas_cfggen-${pkgver}_linux_32-64.zip")
#Mirror: source=("ftp://download2.boulder.ibm.com/ecc/sar/CMA/XSA/ibm_utl_mptsas_cfggen-${pkgver}_linux_32-64.zip")
md5sums=('652d81685e425dd67ebbcbd67c57eec1')

package() {
	cd "${srcdir}"
	install -Dm755 cfggen $pkgdir/usr/bin/cfggen
}
