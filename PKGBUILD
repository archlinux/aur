# Maintainer: Vincent Olivier <vincent@up4.com> 
pkgname=lsi-sas2ircu
pkgver=P20
pkgrel=3
pkgdesc="LSI cfggen utility for 2004 chipset based Avago / LSI Fusion MPT2 SAS devices."
url="http://www.lsi.com"
arch=('x86_64' 'i686')
license=('none')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://docs.avagotech.com/docs-and-downloads/host-bus-adapters/host-bus-adapters-common-files/sas_sata_6g_p20/SAS2IRCU_${pkgver}.zip")
md5sums=('6f9999e093b6b4b56c54427c8f6fd674')

package() {
	cd "${srcdir}"
	install -Dm755 SAS2IRCU_P20/sas2ircu_linux_x86_rel/sas2ircu $pkgdir/usr/bin/sas2ircu
}
