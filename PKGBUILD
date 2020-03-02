# Maintainer: York-Simon Johannsen <info@yosijo.de>

pkgname=firefox-floccus
pkgver=4.0.0.4
pkgrel=1
pkgdesc='Sync your bookmarks across browsers via Nextcloud, WebDAV or a local file (and thus any file sync solution) https://floccus.org'
url=https://github.com/marcelklehr/floccus
arch=('any')
license=('MPL-2.0')
groups=('firefox-addons')
source=("https://addons.mozilla.org/firefox/downloads/file/3517995/floccus-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('2ec58eaa96d5ae9d8a09d9f2d6e0b871b8af880f3639e106f47ebb4606bf144c')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/floccus@handmadeideas.org.xpi
}

# vim:set ts=2 sw=2 et:
