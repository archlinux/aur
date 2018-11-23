# Maintainer: Cookie Engineer <cookiengineer@protonmail.ch>

pkgname=firefox-extension-dark-reader
pkgver=4.6.12
pkgrel=1
pkgdesc='Dark theme for every website. Rest your eyes, use Dark Reader for the night and daily browsing.'
url=https://github.com/darkreader/darkreader
arch=('any')
license=('MIT')
depends=('firefox')
source=("https://addons.mozilla.org/firefox/downloads/file/1132987/dark_reader-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('17acb27b9f1ae7082298ed2f6429aded342747da29f2626cbb5c2f3b5bd5bc77')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/addon@darkreader.org.xpi
}

# vim:set ts=2 sw=2 et:
