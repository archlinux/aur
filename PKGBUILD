# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
# Contributor: Fijxu <fijxu [at] nadeko [dot] net>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Gimo <self@gimo.me>

pkgname=ttf-openmoji
pkgver=17.0.0
pkgrel=2
pkgdesc="Open source emojis for designers, developers and everyone else!"
arch=(any)
url="https://openmoji.org/"
license=(CC-BY-SA-4.0)
depends=(fontconfig)
source=($pkgname-$pkgver.zip::"https://github.com/hfg-gmuend/openmoji/releases/download/$pkgver/openmoji-font.zip")
sha256sums=('1de61d8dcb38d0bebbdd13c7057a65f5d957ead36ce4b61bd635f84e6f3cadba')

package() {
  mkdir -p "$pkgdir/usr/share/fonts/openmoji"
  install -m644 OpenMoji-black-glyf/OpenMoji-black-glyf.ttf "$pkgdir/usr/share/fonts/openmoji"
  # COLRv0 has wider support for desktop programs and browsers
  install -m644 OpenMoji-color-glyf_colr_0/OpenMoji-color-glyf_colr_0.ttf "$pkgdir/usr/share/fonts/openmoji"
}
