# Maintainer: SanskritFritz (gmail)

pkgname=gpsmaster
pkgver=0.63.35
_versioned_filename="GpsMaster_$pkgver.JDK7-8.jar"
pkgrel=1
pkgdesc="Create, view, edit and analyse GPX files."
arch=('any')
license=('GPL2')
depends=('java-runtime')
url="http://gpsmaster.org/"
source=("http://www.gpsmaster.org/download/$_versioned_filename"
        "gpsmaster.sh"
        "gpsmaster.desktop")
noextract=("$_versioned_filename")
md5sums=('e81d40a1e867cdbce3301fb72ef27958'
         'ee58fda742aa0a9472a10b367e186f73'
         '2466049ed8dac363e62f5e47767898b3')

package() {
	install -Dm644 "$_versioned_filename" "${pkgdir}/opt/gpsmaster/GpsMaster.jar"
	install -Dm755 "gpsmaster.sh" "${pkgdir}/usr/bin/gpsmaster"
	install -Dm644 "gpsmaster.desktop" "${pkgdir}/usr/share/applications/gpsmaster.desktop"
}
