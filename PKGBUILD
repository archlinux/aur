# Maintainer: Justin Dray <justin[at]dray[dot]be>
pkgname=lsi-sas2ircu
pkgver=5.00.00.00
pkgrel=2
pkgdesc="LSI cfggen utility for 2004 chipset based LSI Fusion MPT SAS devices"
url="http://www.lsi.com"
arch=('x86_64' 'i686')
license=('none')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://copy.com/D1X42Cf78kCl/public/packages/lsi-sas2ircu-${pkgver}.zip")
# Mirror: source=("http://www.natecarlson.com/wp-content/uploads/2010/08/FAQ_9633_SAS2IRCU_Phase_5.0-5.00.00.00.zip?84f173")
md5sums=('010f2534ed0deef34da211be18203fa3')

package() {
	cd "${srcdir}"
	install -Dm755 sas2ircu_linux_x86_rel/sas2ircu $pkgdir/usr/bin/sas2ircu
}
