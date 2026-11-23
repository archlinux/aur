# Maintainer: Michal Sotolar <michal at sotolar dot com>

pkgname=firefox-extension-floccus
pkgver=5.14.0
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

b2sums=('7f6c103a30c3d989bf0c5ac740a3acdf7915dbd0dd052cb2de225a169392c38027b66d4d2715c94bd2480d819c948680ebb2cd06e353b1db6554705fb301cc47')
