# Maintainer: Petko Bordjukov <bordjukov[at]gmail[dot]com>
pkgname=otf-bulgaria-moderna-pro
pkgver=4.0
pkgrel=1
pkgdesc="Bulgaria Moderna is an OpenType digital font inspired by the Early Cyrillic script developed during the 10th Century in the Preslav Literary School"
url="http://alphadesigner.com/bulgaria-moderna-font/"
arch=('any')
license=('cc-by-nc-3.0')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
install=$pkgname.install
source=("http://alphadesigner.com/fonts/bulgaria-moderna.zip")
sha512sums=('c33471b8735a9d231aa32718e3531b73293f322f1a87d28eeb8a8d95e1a62d55003c91182bd08821e636fc264ea6c9cddae03fe91aca1f678d6731d90c552442')

package() {
  cd "${srcdir}"
  install -Dm644  "Bulgaria Moderna Pro Font Guide.pdf" "$pkgdir/usr/share/doc/$pkgname/Bulgaria Moderna Pro Font Guide.pdf"
  install -Dm644  "Bulgaria Moderna Pro.otf" "$pkgdir/usr/share/fonts/OTF/Bulgaria Moderna Pro.otf"
  install -Dm644  "License.txt" "$pkgdir/usr/share/licenses/$pkgname/License.txt"
}

# vim:set ts=2 sw=2 et:
