# Bjoern Franke <bjo+aur@schafweide.org>

pkgname=gajim-plugin-urlimagepreview
_pkgname=url_image_preview
_pythonversion=3.10
pkgver=2.5.7
pkgrel=2
pkgdesc="Gajim plugin which displays a preview of links to images"
arch=(any)
url="https://dev.gajim.org/gajim/gajim-plugins/wikis/urlimagepreviewplugin"
license=('GPL')
depends=("gajim>=1.2.91" "gajim<=1.3.90" "python-setuptools" "python-cryptography" "python-pillow")
provides=('gajim-plugin-urlimagepreview')
source=("https://ftp.gajim.org/plugins_releases/${_pkgname}_${pkgver}.zip")
sha512sums=('17c6944218fc680644a6c26bdc72c937d0583dc314085f8eb940e9fcfe03f4c8501eddb58d1fd0c0bc406f87e4d704521957344301c3dd6483075acc7bca1ca7')

package() {
  cd ${srcdir}/${_pkgname}

  # Install the plugin
  install -d ${pkgdir}/usr/lib/python${_pythonversion}/site-packages/gajim/data/plugins/${_pkgname}
  cp -r * ${pkgdir}/usr/lib/python${_pythonversion}/site-packages/gajim/data/plugins/${_pkgname}/
}

# vim:set ts=2 sw=2 et:
