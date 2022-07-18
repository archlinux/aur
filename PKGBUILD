# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Gimo <self@gimo.me>

pkgname=otf-openmoji
pkgver=14.0.0
pkgrel=1
pkgdesc="Open source emojis for designers, developers and everyone else!"
arch=(any)
url="https://openmoji.org/"
license=(CCPL:by-sa)
depends=(fontconfig)
source=($pkgname-$pkgver.zip::"https://github.com/hfg-gmuend/openmoji/releases/download/$pkgver/openmoji-font.zip")
sha256sums=('7e8d72de29216cd7b0f889dd82982baf2f2f11842ab8018ecac88bb43a109585')

package() {
  mkdir -p "$pkgdir/usr/share/fonts/openmoji"
  install -m644 OpenMoji-Black.ttf "$pkgdir/usr/share/fonts/openmoji"
  install -m644 OpenMoji-Color.ttf "$pkgdir/usr/share/fonts/openmoji"
}
