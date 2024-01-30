# Maintainer: Fijxu <fijxu <at> nadeko <dot> net>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Gimo <self@gimo.me>

pkgname=otf-openmoji
pkgver=15.0.0
pkgrel=1
pkgdesc="Open source emojis for designers, developers and everyone else!"
arch=(any)
url="https://openmoji.org/"
license=(CCPL:by-sa)
depends=(fontconfig)
source=($pkgname-$pkgver.zip::"https://github.com/hfg-gmuend/openmoji/releases/download/$pkgver/openmoji-font.zip")
sha256sums=('9c157abb27203a3e2f13d5e000c8773015e3e373d3da3c263c1ed917cacbb6de')

package() {
  mkdir -p "$pkgdir/usr/share/fonts/openmoji"
  install -m644 OpenMoji-black-glyf/OpenMoji-black-glyf.ttf "$pkgdir/usr/share/fonts/openmoji"
  # COLRv0 has wider support for desktop programs and browsers
  install -m644 OpenMoji-color-colr0_svg/OpenMoji-color-colr0_svg.ttf "$pkgdir/usr/share/fonts/openmoji"
}
