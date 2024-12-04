# Maintainer: Audun-Marius Gangstø <audun@gangsto.org>
# Maintainer: Fermín Olaiz <ferminolaiz@gmail.com>

pkgname=lsi-sas2ircu
pkgver=20.00.00.00
pkgrel=11
pkgdesc="LSI cfggen utility for 2004/2008 chipset based Avago / LSI Fusion MPT2 SAS devices."
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
sha256sums=('cfcd37dcdb0ccd86d5546e1945e40cfcd11ba8fdaaeee94521a03855f448f35d')

package() {
	cd "${srcdir}"
	install -Dm755 SAS2IRCU_P20/sas2ircu_linux_x86_rel/sas2ircu $pkgdir/usr/bin/sas2ircu
}
