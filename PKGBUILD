# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gimp-plugin-duplicate-to-another-image
pkgver=1.1
pkgrel=2
pkgdesc="Duplicate layer, layer with mask, or layer group from one image to another."
arch=('any')
url="http://slybug.deviantart.com/art/Duplicate-to-another-Image-341012566"
license=('GPL')
depends=('gimp')
source=("http://url.muflone.com/${pkgname}-${pkgver}.zip")
sha256sums=('991b356da0bd18cc492b33b092afa2741fb17ad3c1c41fe444adac2af56cfb50')

package() {
  install -m755 -d "${pkgdir}/usr/lib/gimp/2.0/plug-ins"
  install -m755 -t "${pkgdir}/usr/lib/gimp/2.0/plug-ins" "${pkgname/gimp-plugin-/}.py"
}
