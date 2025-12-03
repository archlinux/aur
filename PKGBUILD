# Maintainer: Michal Sotolar <michal at sotolar dot com>

pkgname=firefox-extension-floccus
pkgver=5.8.1
pkgrel=1

pkgdesc='Sync your bookmarks privately across browsers and devices'
url='https://floccus.org/'

arch=('any')
license=('MPL-2.0')

groups=('firefox-addons')

source=("https://github.com/floccusaddon/floccus/releases/download/v$pkgver/floccus-build-v$pkgver.xpi")
sha256sums=('bebcf4a3364b43a24f4bcc5e53865df66d6e6e6110cd035da473309cfdb18be8')
noextract=("floccus-build-v$pkgver.xpi")

package() {
  install -Dm644 floccus-build-v$pkgver.xpi "$pkgdir/usr/lib/firefox/browser/extensions/floccus@handmadeideas.org.xpi"
}
