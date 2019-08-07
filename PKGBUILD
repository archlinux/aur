# Maintainer: Katherine J. Cumberbatch <stykers@stykers.moe>

pkgname=ttf-bauhaus
pkgver=1.0
pkgrel=2
pkgdesc="A neat font."
arch=('any')
url="https://www.myfonts.com/foundry/FotoStar/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=('local://BauhausBoldItalic.ttf'
        'local://BauhausBold.ttf'
        'local://BauhausItalic.ttf'
        'local://BauhausRegular.ttf'
        'local://BauhausBoldItalic.otf'
        'local://BauhausBold.otf')
install=${pkgname}.install
md5sums=('cd631044b78293e3a5d6453fc6f55a54'
         '872e2904dea37339f57338b7d2d7c600'
         'f15cca0d50f59a5f6c740f1c54785357'
         '223d29d081047e50f0c1872e5de70115'
         'f67cdf869321b167ab670377f41a5caf'
         'ce8d095dd715d9e6bc74ad3fbe342330')

package() {
  install -Dm644 ${srcdir}/BauhausBoldItalic.otf ${pkgdir}/usr/share/fonts/OTF/BauhausBoldItalic.otf
  install -Dm644 ${srcdir}/BauhausBoldItalic.ttf ${pkgdir}/usr/share/fonts/TTF/BauhausBoldItalic.ttf
  install -Dm644 ${srcdir}/BauhausBold.otf ${pkgdir}/usr/share/fonts/OTF/BauhausBold.otf
  install -Dm644 ${srcdir}/BauhausBold.ttf ${pkgdir}/usr/share/fonts/TTF/BauhausBold.ttf
  install -Dm644 ${srcdir}/BauhausItalic.ttf ${pkgdir}/usr/share/fonts/TTF/BauhausItalic.ttf
  install -Dm644 ${srcdir}/BauhausRegular.ttf ${pkgdir}/usr/share/fonts/TTF/BauhausRegular.ttf
}
