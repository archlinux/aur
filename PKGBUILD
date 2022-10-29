# Maintainer: Javier Fernández (jfernandz) <jfernandz1290 at gmail dot com>
# Contributors: George Wilder (georgew) <georgew at tutamail dot com>

pkgname="pokemmo"
pkgver=1.4.8
pkgrel=1
pkgdesc="MMO based on the Pokémon Universe"
arch=('x86_64' 'i686')
url="https://pokemmo.eu"
license=('custom')
depends=('java-runtime' 'wget' 'openssl')
optdepends=('zenity: Information/Error message UI')
install="${pkgname}.install"

source=('pokemmo-launcher' 'pokemmo.desktop' 'pokemmo-launcher.png')
sha256sums=('3d072f4f6f06d3b7d99ef1ee7a413288b7db5cf5c82aac77687617e643cbb955'
            '5be349827e2798bce275c16a554ab32f5aa3cf62859200effa5328c26d1233dc'
            '50d0c73eb7e23dcec4c36304cb9008a448e8127628eadb1166c3343f6fdd5ee3')

package(){
      install -Dm755 "pokemmo-launcher" "${pkgdir}/usr/bin/pokemmo-launcher"
      install -Dm644 "pokemmo.desktop" "${pkgdir}/usr/share/applications/pokemmo.desktop"
      install -Dm644 "pokemmo-launcher.png" "${pkgdir}/usr/share/pixmaps/pokemmo-launcher.png"
}
