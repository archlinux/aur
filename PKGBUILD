# Maintainer: Cookie Engineer <cookiengineer@protonmail.ch>

pkgname=firefox-extension-dark-reader
pkgver=4.6.5
pkgrel=1
pkgdesc='Dark theme for every website. Rest your eyes, use Dark Reader for the night and daily browsing.'
url=https://github.com/darkreader/darkreader
arch=('any')
license=('MIT')
depends=('firefox')
source=("https://addons.mozilla.org/firefox/downloads/file/1049724/dark_reader-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('334904f33714178f02a4ab0ee3c8fb37d1864ffd1d7ec41c7c06ec302de745d2')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/addon@darkreader.org.xpi
}

# vim:set ts=2 sw=2 et:
