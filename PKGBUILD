# Bjoern Franke <bjo+aur@schafweide.org>

pkgname=gajim-plugin-urlimagepreview
_pkgname=url_image_preview
pkgver=2.3.24
pkgrel=1
pkgdesc="Gajim plugin which displays a preview of links to images"
arch=(any)
url="https://dev.gajim.org/gajim/gajim-plugins/wikis/urlimagepreviewplugin"
license=('GPL')
depends=("gajim>=1.0.99" "gajim<=1.1.90" "python-setuptools" "python-cryptography" "python-pillow")
provides=('gajim-plugin-urlimagepreview')
source=("https://ftp.gajim.org/plugins_releases/${_pkgname}_${pkgver}.zip")
sha512sums=('c28a169d8a2f0a0916c0f933bd7c7cd9266041daf63af7c34f92be0b3af4bc4873134961394b9d61fb32c7a20f90eb57a6188bd69ebaf4846b4c9b2153a86968')

package() {
  cd ${srcdir}/${_pkgname}

  # Install the plugin
  install -d ${pkgdir}/usr/lib/python3.8/site-packages/gajim/data/plugins/${_pkgname}
  cp -r * ${pkgdir}/usr/lib/python3.8/site-packages/gajim/data/plugins/${_pkgname}/
}

# vim:set ts=2 sw=2 et:
