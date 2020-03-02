# Maintainer: York-Simon Johannsen <info@yosijo.de>

pkgname=firefox-floccus
pkgver=4.0.2
pkgrel=1
pkgdesc='Sync your bookmarks across browsers via Nextcloud, WebDAV or a local file (and thus any file sync solution) https://floccus.org'
url=https://github.com/marcelklehr/floccus
arch=('any')
license=('MPL-2.0')
groups=('firefox-addons')
source=("https://addons.mozilla.org/firefox/downloads/file/3518265/floccus-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha256sums=('4291680a003691c4583eb657072a53b3999009f204942bcd0824dcb0fe6fe735')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/floccus@handmadeideas.org.xpi
}

# vim:set ts=2 sw=2 et:
