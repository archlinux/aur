# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom-bin
pkgver=0.3.0
pkgrel=0
pkgdesc='Yet another cross-platform graphical process/system monitor.'
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
  '1c3d8cfed580d9ab9e54dbcdd532e7eb4be501d9e4552f30daa327b4f8e9caac7d0382d7a86bd74b9c59fd4d85a92a75ab18b17edf14eb628ff730ccc671a34e'
  SKIP
)

package() {
  install -Dm755 btm "$pkgdir"/usr/bin/btm
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
