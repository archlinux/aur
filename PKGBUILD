# Maintainer: SanskritFritz (gmail)

pkgname=gpsmaster
pkgver=0.63.33
pkgrel=1
pkgdesc="Create, view, edit and analyse GPX files."
arch=('any')
license=('GPL2')
depends=('java-runtime')
url="http://gpsmaster.org/"
source=("http://www.gpsmaster.org/download/GpsMaster_$pkgver.JDK7-12.jar"
        "gpsmaster.sh"
        "gpsmaster.desktop")
noextract=("GpsMaster_$pkgver.JDK7-12.jar")
md5sums=('068ca36526041059fd784fe8a39d11aa'
         'ee58fda742aa0a9472a10b367e186f73'
         '2466049ed8dac363e62f5e47767898b3')

package() {
	install -Dm644 "GpsMaster_$pkgver.JDK7-12.jar" "${pkgdir}/opt/gpsmaster/GpsMaster.jar"
	install -Dm755 "gpsmaster.sh" "${pkgdir}/usr/bin/gpsmaster"
	install -Dm644 "gpsmaster.desktop" "${pkgdir}/usr/share/applications/gpsmaster.desktop"
}

