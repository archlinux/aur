# Maintainer: Michal Sotolar <michal at sotolar dot com>

pkgname=firefox-extension-floccus
pkgver=5.8.3
pkgrel=1

pkgdesc='Sync your bookmarks privately across browsers and devices'
url='https://floccus.org/'

arch=('any')
license=('MPL-2.0')

groups=('firefox-addons')
conflicts=('firefox-floccus')

source=("https://github.com/floccusaddon/floccus/releases/download/v$pkgver/floccus-build-v$pkgver.xpi")
sha256sums=('7ea55ac71b2b1032d472b3f86f03058869ed4db5623b0624eed9b59a33598023')
noextract=("floccus-build-v$pkgver.xpi")

package() {
  install -Dm644 floccus-build-v$pkgver.xpi "$pkgdir/usr/lib/firefox/browser/extensions/floccus@handmadeideas.org.xpi"
}
