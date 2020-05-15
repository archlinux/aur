# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom-bin
pkgver=0.4.3
pkgrel=0
pkgdesc='A cross-platform graphical process/system monitor with a customizable interface and a multitude of features.'
provides=('bottom')
conflicts=('bottom')
arch=('x86_64')
url="https://github.com/ClementTsang/bottom"
license=(MIT)
source=(
  archive-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/bottom_x86_64-unknown-linux-gnu.tar.gz
  LICENSE::${url}/raw/${pkgver}/LICENSE
)
sha512sums=(
  '65864d31012dc3d7afdbe4db3bcd9e1704f058c43c6e9dc3ef0adfc7d6392b3b3f2c023d9947b7c377c97b104a704254541e1b6c88e17c266e711154465bfc1a'
  SKIP
)

package() {
  install -Dm755 btm "$pkgdir"/usr/bin/btm
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
