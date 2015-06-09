# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-roboto-mono
pkgver=20150606
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc='Roboto Mono is a monospaced addition to the Roboto type family.'
arch=('any')
url='https://www.google.com/fonts/specimen/Roboto+Mono'
license=('Apache')
source=("http://www.markusweimar.de/public/ttf-roboto-mono-${pkgver}.zip")
install=${pkgname}.install
sha256sums=('16ca33e93e1c6d9d60eb57045c3d49811df4bef0f8c7f91fd077529388fcfced')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
