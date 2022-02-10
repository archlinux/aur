# Bjoern Franke <bjo+aur@schafweide.org>

pkgname=gajim-plugin-urlimagepreview
_pkgname=url_image_preview
_pythonversion=3.10
pkgver=2.5.9
pkgrel=1
pkgdesc="Gajim plugin which displays a preview of links to images"
arch=(any)
url="https://dev.gajim.org/gajim/gajim-plugins/wikis/urlimagepreviewplugin"
license=('GPL')
depends=("gajim>=1.2.91" "gajim<=1.3.90" "python-setuptools" "python-cryptography" "python-pillow")
provides=('gajim-plugin-urlimagepreview')
source=("https://ftp.gajim.org/plugins_releases/${_pkgname}_${pkgver}.zip")
sha512sums=('f7bf5960e0bcd783a633210ff5e5ac390cb21909946e2980366aee04c01c6b42966159a1e8c99ef8419d9c2291ab4cc7b31c1fc683c723cbd445c8e93093c58a')

package() {
  cd ${srcdir}/${_pkgname}

  # Install the plugin
  install -d ${pkgdir}/usr/lib/python${_pythonversion}/site-packages/gajim/data/plugins/${_pkgname}
  cp -r * ${pkgdir}/usr/lib/python${_pythonversion}/site-packages/gajim/data/plugins/${_pkgname}/
}

# vim:set ts=2 sw=2 et:
