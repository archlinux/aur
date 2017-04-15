# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Tom Vincent <http://tlvince.com/contact>

pkgname=gimp-plugin-layer-via-copy-cut
pkgver=1.6
pkgrel=2
pkgdesc="Copy and move the selected area to a new layer in the same position."
arch=('any')
url="http://slybug.deviantart.com/art/Layer-via-Copy-Cut-305728401"
license=('GPL')
depends=('gimp')
source=("http://url.muflone.com/${pkgname}-${pkgver}.zip")
sha256sums=('6b22d22fd0aab5ac48137d3604581d64aed54f0787db3cf04caa6858285e9643')

package() {
  install -m755 -d "${pkgdir}/usr/lib/gimp/2.0/plug-ins"
  install -m755 -t "${pkgdir}/usr/lib/gimp/2.0/plug-ins" "${pkgname/gimp-plugin-/}.py"
}
