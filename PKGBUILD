# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-term-zshaped
pkgver=1.10.2
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-iosevka-term' 'ttf-iosevka-term-hooky')
install=${pkgname}.install
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/10.iosevka-term-zshaped-${pkgver}.zip"
        "https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md")
sha256sums=('ff19b73f2b70738d57a2e14edd12eba41d0c875f077b8bc05fc1abd79699fa74'
            '6def40494d348d87c383513bab0979ba4ce26ad96249d58df04cf811f866c63f')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
