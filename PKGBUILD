# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=firefox-random-bookmark-from-folder
pkgver=2.0
pkgrel=1
pkgdesc='Open random bookmarks from a chosen folder'
url=https://github.com/PikadudeNo1/RandomBookmark
arch=('any')
license=('GPL3')
groups=('firefox-addons')
source=("https://addons.cdn.mozilla.net/user-media/addons/501278/random_bookmark_from_folder-$pkgver-an+fx-linux.xpi")
noextract=("${source##*/}")
sha256sums=('bd0a239ff3110c59558cb4c5e5e04d4bb45ebd6de02395865f9e66ccd84af33f')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/randombookmark@pikadudeno1.com.xpi
}

# vim:set ts=2 sw=2 et:
