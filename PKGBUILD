# Maintainer: Gimo <self@gimo.me>

pkgname=otf-openmoji
pkgver=12.0.0
pkgrel=1
pkgdesc="Open-source emojis for designers, developers and everyone else!"
arch=(any)
url="http://openmoji.org/"
license=(CCPL:by-sa)
depends=(fontconfig)
source=($pkgname-$pkgver.zip::"https://github.com/hfg-gmuend/openmoji/releases/download/$pkgver/openmoji-font.zip")
sha256sums=('e994fbd4a04f816b59fc6b4a69f1e06e32ad075013e06d6c870c945eab25e019')

package() {
  mkdir -p "$pkgdir"/usr/share/fonts/openmoji
  install -m644 OpenMoji-Black.ttf "$pkgdir"/usr/share/fonts/openmoji
  install -m644 OpenMoji-Color.ttf "$pkgdir"/usr/share/fonts/openmoji
}
