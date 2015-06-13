# Maintainer: Muflone <webreg(at)vbsimple.net>

pkgname=gimp-plugin-scale-layer-to-image-size
pkgver=1.3
pkgrel=1
pkgdesc="Scales the contents of the layer, or layer group, to image size."
arch=('any')
url="http://some-gimp-plugins.com/contents/en/extensions/001/"
license=('GPL')
depends=('gimp')
source=("http://some-gimp-plugins.com/contents/en/extensions/001/${pkgname/gimp-plugin-/}.zip")
md5sums=('693d63044b39ad7996adee71a7157d90')

package() {
  install -m755 -d "${pkgdir}/usr/lib/gimp/2.0/plug-ins"
  install -m755 -t "${pkgdir}/usr/lib/gimp/2.0/plug-ins" "${pkgname/gimp-plugin-/}.py"
}
