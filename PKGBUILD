# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Tom Vincent <http://tlvince.com/contact>

pkgname=gimp-plugin-layer-via-copy-cut
pkgver=1.6
pkgrel=1
pkgdesc="Copy and move the selected area to a new layer in the same position."
arch=('any')
url="http://some-gimp-plugins.com/contents/en/extensions/002/"
license=('GPL')
depends=('gimp')
source=("http://some-gimp-plugins.com/contents/en/extensions/002/${pkgname/gimp-plugin-/}.zip")
md5sums=('8407b941be70215af707672a3bd13110')

package() {
  install -m755 -d "${pkgdir}/usr/lib/gimp/2.0/plug-ins"
  install -m755 -t "${pkgdir}/usr/lib/gimp/2.0/plug-ins" "${pkgname/gimp-plugin-/}.py"
}
