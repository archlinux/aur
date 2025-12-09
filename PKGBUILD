# Maintainer: Michal Sotolar <michal at sotolar dot com>

pkgname=firefox-extension-floccus
pkgver=5.8.2
pkgrel=1

pkgdesc='Sync your bookmarks privately across browsers and devices'
url='https://floccus.org/'

arch=('any')
license=('MPL-2.0')

groups=('firefox-addons')
conflicts=('firefox-floccus')

source=("https://github.com/floccusaddon/floccus/releases/download/v$pkgver/floccus-build-v$pkgver.xpi")
sha256sums=('2489e0f77efe2bb30e4936fc2428f8bf322758193576d6ae21b853fbd99e4b80')
noextract=("floccus-build-v$pkgver.xpi")

package() {
  install -Dm644 floccus-build-v$pkgver.xpi "$pkgdir/usr/lib/firefox/browser/extensions/floccus@handmadeideas.org.xpi"
}
