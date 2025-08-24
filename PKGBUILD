# Maintainer: Network_Jack <Network_Jack@null.net>

_pkgname=reverse_image_search
pkgname=firefox-extension-reverse-image-search
pkgver=4.4.3
pkgrel=1
_file=4553963
pkgdesc="Context menu to search with an image on various services, such as Google, Bing, Yandex, TinEye, SauceNAO and IQDB"
license=('MPL2')
arch=('any')
url="https://github.com/Brawl345/Image-Reverse-Search-WebExtension"
depends=("firefox")
source=("${_pkgname}-${pkgver}.xpi"::"https://addons.mozilla.org/firefox/downloads/file/${_file}/image_reverse_search-${pkgver}.xpi")
noextract=("${_pkgname}-${pkgver}.xpi")
sha256sums=('a7faf99fdf3379e01cab47c6673ea797a67017722423b98871acd78ccb02eb18')

package() {
  cd "${srcdir}"
  _extension_id="{0da2e603-21ba-4422-8049-b6d9e013ed84}"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 ${_pkgname}-${pkgver}.xpi "${_extension_dest}.xpi"
}

