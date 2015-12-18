# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=atlas-maps-beta-bin
pkgver=1.2.25
pkgrel=1
pkgdesc="Map and navigation application using offline vector maps (beta version)"
arch=('any')
url="http://wiki.openstreetmap.org/wiki/Atlas_(navigation_application)"
license=('proprietary (free)')
depends=('java-runtime')
provides=('atlas-maps')
conflicts=('atlas-maps')
source=("http://www.talent.gr/public/atlas/atlas-beta-${pkgver}.zip"
        "atlas-maps.sh")
md5sums=('23588474a1859954e252534bd6939689'
         '509caab1fb6ad3990e87890a5dfb7d81')

package() {
    install -Dm644 "atlas-beta/atlas-beta.jar" "$pkgdir/usr/share/java/atlas-maps/atlas.jar"
    install -Dm755 atlas-maps.sh "$pkgdir/usr/bin/atlas-maps"
}
