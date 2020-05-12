# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom-bin
pkgver=0.4.2
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
  '088d964fcb54d73439b2ca34d337bd90c63fcb27158480f698d32560481cd7024e841e731913bc008ab3e555d0d8411075f1a2d968208fab79a0fb8c8e773bc5'
  SKIP
)

package() {
  install -Dm755 btm "$pkgdir"/usr/bin/btm
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
