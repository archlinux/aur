# Maintainer: Muflone <webreg(at)vbsimple.net>

pkgname=gimp-plugin-create-layer-mask-from
pkgver=1.0
pkgrel=1
pkgdesc="Create layer mask from another layer mask."
arch=('any')
url="http://some-gimp-plugins.com/contents/en/extensions/003/"
license=('GPL')
depends=('gimp')
source=("http://some-gimp-plugins.com/contents/en/extensions/003/${pkgname/gimp-plugin-/}.zip")
md5sums=('693d63044b39ad7996adee71a7157d90')

package() {
  install -m755 -d "${pkgdir}/usr/lib/gimp/2.0/plug-ins"
  install -m755 -t "${pkgdir}/usr/lib/gimp/2.0/plug-ins" "${pkgname/gimp-plugin-/}.py"
}
