# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka
pkgver=0.1.9
pkgrel=2
depends=('fontconfig' 'xorg-font-utils')
pkgdesc='Iosevka is a monospace coding typeface inspired by Pragmata Pro, M+ and PF DIN Mono. It is designed to have a narrow shape to be space efficient and compatible to CJK characters.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
source=("https://github.com/be5invis/Iosevka/archive/v${pkgver}.zip"
        'https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE')
install=${pkgname}.install
sha256sums=('d81daab3a78bb61e2418391f023f795d37c5b1b59634fee54f880a921fb50188'
            '1beea52b7cf6b8f5fa3120f3b6fc4bd5828037bdbe513624ea55100876654c18')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 Iosevka-${pkgver}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
