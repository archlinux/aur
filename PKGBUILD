# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gimp-plugin-create-layer-mask-from
pkgver=1.0
pkgrel=2
pkgdesc="Create layer mask from another layer mask."
arch=('any')
url="http://slybug.deviantart.com/art/Create-Layer-Mask-from-324277895"
license=('GPL')
depends=('gimp')
source=("http://url.muflone.com/${pkgname}-${pkgver}.zip")
sha256sums=('e71450605670b6afad4622a83cde3852aa0cb800ba437c7def44634f5de6c40c')

package() {
  install -m755 -d "${pkgdir}/usr/lib/gimp/2.0/plug-ins"
  install -m755 -t "${pkgdir}/usr/lib/gimp/2.0/plug-ins" "${pkgname/gimp-plugin-/}.py"
}
