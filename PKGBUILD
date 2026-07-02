# Maintainer: Michal Sotolar <michal at sotolar dot com>

pkgname=firefox-extension-floccus
pkgver=5.9.2
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

b2sums=('a5a09fe8ed2a54186fac60b766f6460aa876ca75056df631b6837823b584020b46cc16dac06468671d610c324e67761d7717a31021e6961a5d6f053f94ca3839')
