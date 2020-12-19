# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=firefox-extension-search-by-image
pkgver=3.4.2
pkgrel=1
pkgdesc="Search by Image add-on for Firefox"
arch=(any)
url="https://addons.mozilla.org/en-US/firefox/addon/search_by_image/"
depends=("firefox")
license=("GPL3")
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/3690470/search_by_image-${pkgver}-an+fx.xpi")
sha256sums=("2987a5f9c9b043de969f166d8f2275e3c2147fe2e3d186eb8a13f8cc5bd3c45d")
noextract=("extension.xpi")
uuid="{2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c}"

package() {
	install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/${uuid}.xpi"
}
