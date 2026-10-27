# Maintainer: Michal Sotolar <michal at sotolar dot com>

pkgname=firefox-extension-floccus
pkgver=5.12.0
pkgrel=1

pkgdesc='Sync your bookmarks privately across browsers and devices'
arch=('any')
url='https://floccus.org/'
license=('MPL-2.0')
groups=('firefox-addons')

depends=('firefox>=58.0')
conflicts=('firefox-floccus')

source=("https://github.com/floccusaddon/floccus/releases/download/v$pkgver/floccus-build-v$pkgver.xpi")
noextract=("floccus-build-v$pkgver.xpi")

package() {
  install -Dm644 floccus-build-v$pkgver.xpi "$pkgdir/usr/lib/firefox/browser/extensions/floccus@handmadeideas.org.xpi"
}

b2sums=('9214988721627e56bc3bd0067c29ebbbbc0549e293fe755ea1cb892fb32e099a153aeed190e138fe9837d8cced4c8fd79e52e66f2e4e53e6c224375accd63186')
