# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Gimo <self@gimo.me>

pkgname=otf-openmoji
pkgver=13.1.0
pkgrel=1
pkgdesc="Open source emojis for designers, developers and everyone else!"
arch=(any)
url="https://openmoji.org/"
license=(CCPL:by-sa)
depends=(fontconfig)
source=($pkgname-$pkgver.zip::"https://github.com/hfg-gmuend/openmoji/releases/download/$pkgver/openmoji-font.zip")
sha256sums=('85587ae43d98dfa1a0c23622243e0692c7b3566cbd761e7370036c34321cbe76')

package() {
  mkdir -p "$pkgdir/usr/share/fonts/openmoji"
  install -m644 OpenMoji-Black.ttf "$pkgdir/usr/share/fonts/openmoji"
  install -m644 OpenMoji-Color.ttf "$pkgdir/usr/share/fonts/openmoji"
}
