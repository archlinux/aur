# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=('dell-drac-mibs')
pkgver=8.5.A00
pkgrel=1
pkgdesc='SNMP MIBs for Dell iDRAC remote management controllers'
arch=('any')
url='https://www.dell.com/support/home/au/en/audhs1/drivers/driversdetails?driverId=YKG8D'
license=('custom:dell')
depends=('net-snmp')
makedepends=('unzip')
source=('https://downloads.dell.com/FOLDER04163334M/1/Dell-OM-MIBS-850_A00.zip')
md5sums=('42b0e80220fc7ffb5d6d5e711cb54268')
sha256sums=('557a853bd63436bb1391d7626092ea05c1b9f30cc45687e287412b198b58b6d4')

package() {
	unzip -jo Dell*.zip
	install -Dm0644 *.mib -t "$pkgdir/usr/share/snmp/mibs/"
}
