# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka
pkgver=0.0.4
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc='Iosevka is a monospace coding typeface inspired by Pragmata Pro, M+ and PF DIN Mono. It is designed to have a narrow shape to be space efficient and compatible to CJK characters.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
source=("http://www.markusweimar.de/public/ttf-iosevka-${pkgver}.zip")
install=${pkgname}.install
sha256sums=('c762c904f31f62326efedd8337b24cfb30e7e99e67a73f31e09d8952a6544bfe')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
