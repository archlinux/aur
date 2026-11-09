# Maintainer: Michal Sotolar <michal at sotolar dot com>

pkgname=firefox-extension-floccus
pkgver=5.13.0
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

b2sums=('82e7e11797d1610c2f3e656cc8ad1e0bdc007c7616b19a497a9323d790410ece8b40f97602a58be7151b6a693604105bb56f1093444ea7f4354dfd7a405ffb66')
