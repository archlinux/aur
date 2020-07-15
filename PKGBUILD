# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: Lukas Kohler <lux@ontheblueplanet.com>

pkgname=chdkptp
pkgver=r921
pkgrel=1
pkgdesc="chdkptp is a client application for the CHDK"
arch=("x86_64")
url="https://www.assembla.com/spaces/chdkptp"
license=('GPL' 'MIT')
source=("https://www.assembla.com/spaces/bFfcHmwmKr4i4TeJe5cbLr/documents/d5TPEmf_ur6PhcaIC_Qgzw/download/d5TPEmf_ur6PhcaIC_Qgzw" "chdkptp.sh" "chdkptp-gui.sh")
md5sums=("970acfe17bb0c65cb4fdb7820c643018" "d7946256ddd99be97592fd4df7d3ae86" "dbcda126bcdf108a8f20fe49d921cadc")

package() {
	install -Dm755 chdkptp $pkgdir/usr/lib/chdkptp/chdkptp
	install -Dm755 chdkptp_gui $pkgdir/usr/lib/chdkptp/chdkptp_gui
	install -dm644 "$pkgdir/usr/lib/chdkptp/lua/extras"
	install -m644 lua/*.lua "$pkgdir"/usr/lib/chdkptp/lua/
	install -m644 lua/extras/*.lua "$pkgdir"/usr/lib/chdkptp/lua/extras/
	install -Dm755 chdkptp.sh "$pkgdir"/usr/bin/chdkptp
	install -Dm755 chdkptp-gui.sh "$pkgdir"/usr/bin/chdkptp-gui
}
