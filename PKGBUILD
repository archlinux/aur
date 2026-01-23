# Maintainer: Michal Sotolar <michal at sotolar dot com>

pkgname=firefox-extension-floccus
pkgver=5.8.6
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

b2sums=('49c8a6a7f51ccc71467aa22b1d83d9f909cb5b61d5227c5fe2064b48ba92af9bcfbc430cbb93526478b82f51dc8a01de1a7c0a8b812b654f03cec98b5aeda889')
