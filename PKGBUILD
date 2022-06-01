# Bjoern Franke <bjo+aur@schafweide.org>

pkgname=gajim-plugin-urlimagepreview
_pkgname=url_image_preview
_pythonversion=3.10
pkgver=2.6.8
pkgrel=1
pkgdesc="Gajim plugin which displays a preview of links to images"
arch=(any)
url="https://dev.gajim.org/gajim/gajim-plugins/wikis/urlimagepreviewplugin"
license=('GPL')
depends=("gajim>=1.4" "gajim<=1.4.90" "python-setuptools" "python-cryptography" "python-pillow")
provides=('gajim-plugin-urlimagepreview')
source=("https://ftp.gajim.org/plugins_releases/${_pkgname}_${pkgver}.zip")
sha512sums=('2755767465edbd51e3ab24518aa5d009ef33b45427e7dfb45aecd8fca4171e3ee379b4db08146491b1d8c7d6c8a33cab0f35575827ba54010246a2ab5df2f07d')

package() {
  cd ${srcdir}/${_pkgname}

  # Install the plugin
  install -d ${pkgdir}/usr/lib/python${_pythonversion}/site-packages/gajim/data/plugins/${_pkgname}
  cp -r * ${pkgdir}/usr/lib/python${_pythonversion}/site-packages/gajim/data/plugins/${_pkgname}/
}

# vim:set ts=2 sw=2 et:
