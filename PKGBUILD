# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-withfw-cc
pkgver=1.6.0
pkgrel=1
pkgdesc='A slender monospace typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
install=${pkgname}.install
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/withfw-cc-iosevka-${pkgver}.zip"
        'https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE')
sha256sums=('807b0b9825ccb460450f9203a1250452faec9d79efae3d3ab01d6fb5cf758e59'
            '79e60eb609efc006ca2a552d998efb1675262d4cae848244a3e2e61df0894b0c')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 withfw-cc-iosevka/*.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
