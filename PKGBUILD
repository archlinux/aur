# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Hexchain Tong <i@hexchain.org>

pkgname=ttf-opensans
pkgver=1.10
pkgrel=3
pkgdesc='Sans-serif typeface designed by Steve Matteson and commissioned by Google'
arch=('any')
url='https://fonts.google.com/specimen/Open+Sans'
license=('Apache')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("${pkgname}.zip::https://fonts.google.com/download?family=Open%20Sans"
        "${pkgname}-condensed.zip::https://fonts.google.com/download?family=Open%20Sans%20Condensed")
sha256sums=('b1e0925c81122343c10b4bd4f7406120394eee5203748a6ce9693e68780d090a'
            '935779dd026974279b90173718de96d5e01f8f0c0e51fd719894586bbb50c6cb')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
