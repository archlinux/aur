# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-roboto-mono
pkgver=2.000985
pkgrel=1
epoch=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc='Roboto Mono is a monospaced addition to the Roboto type family.'
arch=('any')
url='https://www.google.com/fonts/specimen/Roboto+Mono'
license=('Apache')
source=("$pkgname-$pkgver-$pkgrel.zip::https://www.google.com/fonts/download?kit=rqQ1zSE-ZGCKVZgew-A9dofD-WQWLbF4rYwcBGowFYY")
install=${pkgname}.install
sha256sums=('SKIP')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
