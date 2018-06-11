# Maintainer: Marcus M. Scheunemann <find@mms.ai>
pkgname=ttf-bree-serif
pkgver=1.002
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc='Bree Serif is a font by TypeTogether, an independent type foundry committed to excellence in type design with a focus on editorial use.'
arch=('any')
url='https://fonts.google.com/specimen/Bree+Serif'
license=('Open Font License')
source=('https://raw.githubusercontent.com/google/fonts/master/ofl/breeserif/OFL.txt'
        'https://raw.githubusercontent.com/google/fonts/master/ofl/breeserif/BreeSerif-Regular.ttf')
install=${pkgname}.install
sha256sums=('fbe0442a6b1ce162c95e241df76cab5ef2daf6a5ac84ae1a7a6749f32c051098'
            'fd080582d70112ef479ba4ddd72407f9a4fcbcec4caa7d29de259b13eeb5f431')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
