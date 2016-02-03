# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=atlas-maps-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Map and navigation application using offline vector maps"
arch=('any')
url="http://wiki.openstreetmap.org/wiki/Atlas_(navigation_application)"
license=('proprietary (free)')
depends=('java-runtime')
provides=('atlas-maps')
conflicts=('atlas-maps')
source=("http://www.talent.gr/public/atlas/atlas-${pkgver}.zip"
        "atlas-maps.sh")
md5sums=('25b9de56e52c6e54025677e398b13851'
         '509caab1fb6ad3990e87890a5dfb7d81')

package() {
    install -Dm644 "atlas/atlas.jar" "$pkgdir/usr/share/java/atlas-maps/atlas.jar"
    install -Dm755 atlas-maps.sh "$pkgdir/usr/bin/atlas-maps"
}
