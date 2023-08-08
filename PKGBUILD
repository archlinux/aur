# Maintainer: SanskritFritz (gmail)

pkgname=gpsmaster
pkgver=0.64.02
_versioned_filename="GpsMaster_$pkgver.jar"
pkgrel=1
pkgdesc="Create, view, edit and analyse GPX files."
arch=('any')
license=('GPL2')
depends=('java-runtime')
url="http://gpsmaster.org/"
source=("https://github.com/tboegi/GpsMaster/releases/download/v$pkgver/$_versioned_filename"
        "gpsmaster.sh"
        "gpsmaster.desktop")
noextract=("$_versioned_filename")
md5sums=('9e58b1e09c2e7ed425708874f9dbb32b'
         'ee58fda742aa0a9472a10b367e186f73'
         '2466049ed8dac363e62f5e47767898b3')

package() {
	install -Dm644 "$_versioned_filename" "${pkgdir}/opt/gpsmaster/GpsMaster.jar"
	install -Dm755 "gpsmaster.sh" "${pkgdir}/usr/bin/gpsmaster"
	install -Dm644 "gpsmaster.desktop" "${pkgdir}/usr/share/applications/gpsmaster.desktop"
}
