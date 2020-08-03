# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Gimo <self@gimo.me>

pkgname=otf-openmoji
pkgver=12.4.0
pkgrel=1
pkgdesc="Open source emojis for designers, developers and everyone else!"
arch=(any)
url="https://openmoji.org/"
license=(CCPL:by-sa)
depends=(fontconfig)
source=($pkgname-$pkgver.zip::"https://github.com/hfg-gmuend/openmoji/releases/download/$pkgver/openmoji-font.zip")
sha256sums=('abd3f7d560ac2fb071dc066358eaab09ed7ca297cff1213682a0246677797b73')

package() {
  mkdir -p "$pkgdir/usr/share/fonts/openmoji"
  install -m644 OpenMoji-Black.ttf "$pkgdir/usr/share/fonts/openmoji"
  install -m644 OpenMoji-Color.ttf "$pkgdir/usr/share/fonts/openmoji"
}
