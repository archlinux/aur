# Maintainer: York-Simon Johannsen <info@yosijo.de>

pkgname=firefox-floccus
pkgver=3.5.3
pkgrel=1
pkgdesc='Sync your bookmarks across browsers via Nextcloud, WebDAV or a local file (and thus any file sync solution) https://floccus.org'
url=https://github.com/marcelklehr/floccus
arch=('any')
license=('MPL-2.0')
groups=('firefox-addons')
source=("https://addons.mozilla.org/firefox/downloads/file/3469973/floccus-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('bd14c256a8f4164a2a4c69a23c047940df8cb186abb6b6fd5237184a9c7455eb')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/floccus@handmadeideas.org.xpi
}

# vim:set ts=2 sw=2 et:
