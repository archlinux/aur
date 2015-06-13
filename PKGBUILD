# Maintainer: Muflone <webreg(at)vbsimple.net>

pkgname=gimp-plugin-duplicate-to-another-image
pkgver=1.1
pkgrel=1
pkgdesc="Duplicate layer, layer with mask, or layer group from one image to another."
arch=('any')
url="http://some-gimp-plugins.com/contents/en/extensions/004/"
license=('GPL')
depends=('gimp')
source=("http://some-gimp-plugins.com/contents/en/extensions/004/${pkgname/gimp-plugin-/}.zip")
md5sums=('8c21299a717458d32a270ac2ca541681')

package() {
  install -m755 -d "${pkgdir}/usr/lib/gimp/2.0/plug-ins"
  install -m755 -t "${pkgdir}/usr/lib/gimp/2.0/plug-ins" "${pkgname/gimp-plugin-/}.py"
}
