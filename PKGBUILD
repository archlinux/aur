# Maintainer: Audun-Marius Gangstø <audun@gangsto.org>
pkgname=lsi-sas2ircu
pkgver=20.00.00.00
pkgrel=11
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
source=("https://docs.broadcom.com/docs-and-downloads/host-bus-adapters/host-bus-adapters-common-files/sas_sata_6g_p20/SAS2IRCU_P20.zip")
md5sums=('57e7ffd2b3221c5d7b471b23ec429b8b')

package() {
	cd "${srcdir}"
	install -Dm755 SAS2IRCU_P20/sas2ircu_linux_x86_rel/sas2ircu $pkgdir/usr/bin/sas2ircu
}
