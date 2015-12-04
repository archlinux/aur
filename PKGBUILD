# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=atlas-maps-bin
pkgver=1.1.18
pkgrel=1
pkgdesc="Map and navigation application using offline vector maps"
arch=('any')
url="http://wiki.openstreetmap.org/wiki/Atlas_(navigation_application)"
license=('proprietary (free)')
depends=('java-runtime')
provides=('atlas-maps')
conflicts=('atlas-maps')
source=("http://www.talent.gr/public/atlas/Atlas-${pkgver}.zip"
        "atlas-maps.sh")
md5sums=('ca6ed15e108307c59ef71cf9fad93d31'
         '509caab1fb6ad3990e87890a5dfb7d81')

package() {
    install -Dm644 "Atlas-${pkgver}/Atlas.jar" "$pkgdir/usr/share/java/atlas-maps/atlas.jar"
    install -Dm755 atlas-maps.sh "$pkgdir/usr/bin/atlas-maps"
}
