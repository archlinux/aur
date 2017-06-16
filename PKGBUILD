# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Hexchain Tong <i@hexchain.org>

pkgname=ttf-opensans
pkgver=1.10
pkgrel=4
pkgdesc='Sans-serif typeface designed by Steve Matteson and commissioned by Google'
arch=('any')
url='https://fonts.google.com/specimen/Open+Sans'
license=('Apache')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("${pkgname}.zip::https://fonts.google.com/download?family=Open%20Sans"
        "${pkgname}-condensed.zip::https://fonts.google.com/download?family=Open%20Sans%20Condensed")
sha256sums=('ba3df6c0e20f2aea2a1f233c443402605d52d8b46a76fe0debfa2bf25c3fe049'
            'bcc82a16b1458668fbf32ef813c11f10a015ec8c16c9967b12150ffcf29003c6')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
