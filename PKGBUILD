# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=firefox-extension-search-by-image
pkgver=3.6.4
pkgrel=1
pkgdesc="Search by Image add-on for Firefox"
arch=(any)
url="https://addons.mozilla.org/en-US/firefox/addon/search_by_image/"
depends=("firefox")
license=("GPL3")
source=("extension-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/3796475/search_by_image-${pkgver}-an+fx.xpi")
sha256sums=('2601cce6b4f8a767fe85c70e18ca18e797c91f57eb053192e92cd23538255f19')
noextract=("extension-${pkgver}.xpi")
uuid="{2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c}"

package() {
	install -Dm644 extension-${pkgver}.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/${uuid}.xpi"
}
