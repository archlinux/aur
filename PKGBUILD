# Bjoern Franke <bjo+aur@schafweide.org>

pkgname=gajim-plugin-urlimagepreview
_pkgname=url_image_preview
pkgver=2.3.23
pkgrel=2
pkgdesc="Gajim plugin which displays a preview of links to images"
arch=(any)
url="https://dev.gajim.org/gajim/gajim-plugins/wikis/urlimagepreviewplugin"
license=('GPL')
depends=("gajim>=1.0.99" "gajim<=1.1.90" "python-setuptools" "python-cryptography" "python-pillow")
provides=('gajim-plugin-urlimagepreview')
source=("https://ftp.gajim.org/plugins_releases/${_pkgname}_${pkgver}.zip")
sha512sums=('996c96dd7bd4ca6160d6bea1103b14149bc42df651296a2b2edf0abb72ab95b2eae556a2dd27fbffd1f540a00550caf3a51f770eac0e43382bf217a705310291')
package() {
  cd ${srcdir}/${_pkgname}

  # Install the plugin
  install -d ${pkgdir}/usr/lib/python3.8/site-packages/gajim/data/plugins/${_pkgname}
  cp -r * ${pkgdir}/usr/lib/python3.8/site-packages/gajim/data/plugins/${_pkgname}/
}

# vim:set ts=2 sw=2 et:
