pkgname=firefox-extension-image-block
pkgver=5.0
pkgdesc="Image Block adds a toggle button that conditionally blocks/allows loading of images on webpages."
pkgrel=1
_file=1086368
arch=('any')
url="https://addons.mozilla.org/firefox/addon/5613"
license=('LGPL')
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/file/${_file}/image_block-5.0-fx.xpi")
sha256sums=('5b6dc4ae8be10d5224d1179e9de7eac140f29fc64f0e1e60bb766c03bb94ac8f')

package() {
  _extension_id="imageblock@hemantvats.com"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 "${srcdir}"/image_block-${pkgver}-fx.xpi "${_extension_dest}.xpi"
}


