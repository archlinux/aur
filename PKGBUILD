# Maintainer: Fijxu <fijxu [at] nadeko [dot] net>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Gimo <self@gimo.me>

pkgname=otf-openmoji
pkgver=16.0.0
pkgrel=1
pkgdesc="Open source emojis for designers, developers and everyone else!"
arch=(any)
url="https://openmoji.org/"
license=(CC-BY-SA-4.0)
depends=(fontconfig)
source=($pkgname-$pkgver.zip::"https://github.com/hfg-gmuend/openmoji/releases/download/$pkgver/openmoji-font.zip")
sha256sums=('4ff90e4fbdcf29bfe5c6ff477bc5c61a1280945bcc13113a63f8560590b0edbb')

package() {
  mkdir -p "$pkgdir/usr/share/fonts/openmoji"
  install -m644 OpenMoji-black-glyf/OpenMoji-black-glyf.ttf "$pkgdir/usr/share/fonts/openmoji"
  # COLRv0 has wider support for desktop programs and browsers
  install -m644 OpenMoji-color-colr0_svg/OpenMoji-color-colr0_svg.ttf "$pkgdir/usr/share/fonts/openmoji"
}
