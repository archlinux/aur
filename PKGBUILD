# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=atlas-maps-bin
pkgver=1.2.2
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
md5sums=('162d1fb2f73e1ff6fc2f91f3070606f0'
         '509caab1fb6ad3990e87890a5dfb7d81')

package() {
    install -Dm644 "atlas/atlas.jar" "$pkgdir/usr/share/java/atlas-maps/atlas.jar"
    install -Dm755 atlas-maps.sh "$pkgdir/usr/bin/atlas-maps"
}
