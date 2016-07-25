# Maintainer: Javier Fernández (WyRe) <WyRe12@gmail.com>
# Contributer: WyRe

pkgname="pokemmo"
pkgver=1.1
pkgrel=1
pkgdesc="An MMO based on the Pokémon Universe"
arch=('any')
url="http://pokemmo.eu"
license=('custom')
depends=('java-runtime')
install="${pkgname}.install"

source=("https://pokemmo.eu/download_file/?id=5/${pkgname}_${pkgver}.rpm")
sha256sums=('b56780bcbe37c8f155be16788d79a790d4231018687e279d3b8782e644e2114e')

package(){
      install -Dm755 "${srcdir}/usr/bin/pokemmo-launcher" "${pkgdir}/usr/bin/pokemmo-launcher"
      cp -r "${srcdir}/usr/share" "${pkgdir}/usr/share"
}
