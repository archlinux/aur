# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-cc
pkgver=1.10.1
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
install=${pkgname}.install
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/03.iosevka-cc-${pkgver}.zip"
        "https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md")
sha256sums=('e3b48e12d16a7e6e5bab8e56a8e0b4234efbc6d3717221e446f2e5c7c0dfd68c'
            '6def40494d348d87c383513bab0979ba4ce26ad96249d58df04cf811f866c63f')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
