# Maintainer: Javier Fernández (WyRe) <WyRe12@gmail.com>
# Contributer: WyRe

pkgname="pokemmo"
pkgver=1.2.1
pkgrel=1
pkgdesc="MMO based on the Pokémon Universe"
arch=('any')
url="http://pokemmo.eu"
license=('custom')
depends=('java-runtime')
install="${pkgname}.install"

source=("https://pokemmo.eu/download_file/?id=5/${pkgname}_${pkgver}.rpm")
sha256sums=('dc37446213a95bd6c8b8192514c68bd8ad69b53ccc6ffc18512fb5c59cd4dc07')

package(){
      install -Dm755 "${srcdir}/usr/bin/pokemmo-launcher" "${pkgdir}/usr/bin/pokemmo-launcher"
      cp -r "${srcdir}/usr/share" "${pkgdir}/usr/share"
}
