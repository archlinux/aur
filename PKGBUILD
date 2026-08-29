# Maintainer: Javier Fernández (jfernandz) <jfernandz1290 at gmail dot com>
# Contributors: George Wilder (georgew) <georgew at tutamail dot com>

pkgname="pokemmo"
pkgver=4.0
pkgrel=1
pkgdesc="MMO based on the Pokémon Universe"
arch=('x86_64' 'aarch64')
url="https://pokemmo.eu"
license=('custom')
depends=('wget' 'unzip')
optdepends=('zenity: Information/Error message UI')

source=('pokemmo-launcher' 'pokemmo.desktop' 'pokemmo-launcher.png')
sha256sums=('260acc2f34ef5b44fb15495892d075897b28368d0f0325cb254a035e60b709d9'
            '5be349827e2798bce275c16a554ab32f5aa3cf62859200effa5328c26d1233dc'
            '50d0c73eb7e23dcec4c36304cb9008a448e8127628eadb1166c3343f6fdd5ee3')

package(){
      install -Dm755 "pokemmo-launcher" "${pkgdir}/usr/bin/pokemmo-launcher"
      install -Dm644 "pokemmo.desktop" "${pkgdir}/usr/share/applications/pokemmo.desktop"
      install -Dm644 "pokemmo-launcher.png" "${pkgdir}/usr/share/pixmaps/pokemmo-launcher.png"
}
