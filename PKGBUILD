# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom-bin
pkgver=0.4.6
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
  'c52e4e8462a1f53e29135b43345acf448bb4212148d009a7cbab5ad71d124d8ce8621ab361395229a5c2cd6fd21e6240fe7c4f69bcbb40242ab0c5173d66fab9'
  SKIP
)

package() {
  install -Dm755 btm "$pkgdir"/usr/bin/btm
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
