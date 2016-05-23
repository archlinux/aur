# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=cruiser
pkgver=1.2.5
pkgrel=1
pkgdesc="Map and navigation application using offline vector maps"
arch=('any')
url="http://wiki.openstreetmap.org/wiki/Cruiser"
license=('proprietary (free)')
depends=('java-runtime')
conflicts=('atlas-maps')
replaces=('atlas-maps' 'atlas-maps-bin' 'atlas-maps-beta-bin')
source=("http://www.talent.gr/public/cruiser/cruiser-${pkgver}.zip"
        "cruiser.sh")
md5sums=('b6fdc9db2843925ed5970e451197246e'
         'ab6112f9530a64b9ac8706ab7057cc8c')

package() {
    install -Dm644 "cruiser/cruiser.jar" "$pkgdir/usr/share/java/cruiser/cruiser.jar"
    install -Dm755 cruiser.sh "$pkgdir/usr/bin/cruiser"
}
