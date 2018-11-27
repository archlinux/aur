# Maintainer: Gimo <self@gimo.me>

pkgname=otf-openmoji
pkgver=1.0.0
pkgrel=1
pkgdesc="Open-source emojis for designers, developers and everyone else!"
arch=(any)
url="http://openmoji.org/"
license=(CCPL:by-sa)
depends=(fontconfig)
source=($pkgname-$pkgver.zip::"https://github.com/hfg-gmuend/openmoji/releases/download/$pkgver/font.zip")
sha256sums=('453e1dede7181943e8d0c7087a15a85f270dbbdf5f68b6a46aa3496769f7f9eb')

package() {
  mkdir -p "$pkgdir"/usr/share/fonts/openmoji
  install -m644 font/OpenMoji-Black.otf "$pkgdir"/usr/share/fonts/openmoji
  install -m644 font/OpenMoji-Color.otf "$pkgdir"/usr/share/fonts/openmoji
}
