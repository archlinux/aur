# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Gimo <self@gimo.me>

pkgname=otf-openmoji
pkgver=12.3.0
pkgrel=1
pkgdesc="Open source emojis for designers, developers and everyone else!"
arch=(any)
url="https://openmoji.org/"
license=(CCPL:by-sa)
depends=(fontconfig)
source=($pkgname-$pkgver.zip::"https://github.com/hfg-gmuend/openmoji/releases/download/$pkgver/openmoji-font.zip")
sha256sums=('7df5a048f600f3a60832a772586dd10d226e963178caf57b44d8d1a5727ef668')

package() {
  mkdir -p "$pkgdir/usr/share/fonts/openmoji"
  install -m644 OpenMoji-Black.ttf "$pkgdir/usr/share/fonts/openmoji"
  install -m644 OpenMoji-Color.ttf "$pkgdir/usr/share/fonts/openmoji"
}
