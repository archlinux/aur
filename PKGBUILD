# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom-bin
pkgver=0.4.7
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
  '665afc93beeca4b61d0fa49e691df25a51c6c9fc5395214f2cddce4704898530ae29ffa1884475c2adc2125c664ca29166abbd8376b561e0a5d2663c8d2175e4'
  SKIP
)

package() {
  install -Dm755 btm "$pkgdir"/usr/bin/btm
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
