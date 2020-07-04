# Maintainer: York-Simon Johannsen <info@yosijo.de>

pkgname=firefox-floccus
pkgver=4.2.5
pkgrel=1
pkgdesc='Sync your bookmarks across browsers via Nextcloud, WebDAV or a local file (and thus any file sync solution) https://floccus.org'
url=https://github.com/marcelklehr/floccus
arch=('any')
license=('MPL-2.0')
groups=('firefox-addons')
source=("https://addons.mozilla.org/firefox/downloads/file/3589976/floccus-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('65afcca9e28aa5bbd18c4920cca3c3cc386b6e7b88822d714c5198a04a4dc938')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/floccus@handmadeideas.org.xpi
}

# vim:set ts=2 sw=2 et:
