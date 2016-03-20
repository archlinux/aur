# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gimp-plugin-place-layer-into-selection
pkgver=1.0
pkgrel=1
pkgdesc="Place a layer in a rectangular selection area."
arch=('any')
url="http://some-gimp-plugins.com/contents/en/extensions/005/"
license=('GPL')
depends=('gimp')
source=("http://some-gimp-plugins.com/contents/en/extensions/005/${pkgname/gimp-plugin-/}.zip")
sha256sums=('7fefd4d51c3c562ff724af5ba3aef72a4b7cfb87d31ccb5af685d01abb6ed11f')

package() {
  install -m755 -d "${pkgdir}/usr/lib/gimp/2.0/plug-ins"
  install -m755 -t "${pkgdir}/usr/lib/gimp/2.0/plug-ins" "${pkgname/gimp-plugin-/}.py"
}
