# Maintainer: Gimo <self@gimo.me>

pkgname=otf-openmoji
pkgver=12.2.0
pkgrel=1
pkgdesc="Open source emojis for designers, developers and everyone else!"
arch=(any)
url="https://openmoji.org/"
license=(CCPL:by-sa)
depends=(fontconfig)
source=($pkgname-$pkgver.zip::"https://github.com/hfg-gmuend/openmoji/releases/download/$pkgver/openmoji-font.zip")
sha256sums=('f068ad956b636e5234d606968564ee93e3360499fa4ce38cfea0ed12629dee07')

package() {
  mkdir -p "$pkgdir/usr/share/fonts/openmoji"
  install -m644 OpenMoji-Black.ttf "$pkgdir/usr/share/fonts/openmoji"
  install -m644 OpenMoji-Color.ttf "$pkgdir/usr/share/fonts/openmoji"
}
