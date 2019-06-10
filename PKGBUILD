# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=rbspy-bin
pkgver=0.3.6
pkgrel=1
pkgdesc="Sampling profiler for Ruby"
arch=('x86_64')
url="https://rbspy.github.io"
license=('MIT')
makedepends=('fakeroot')
conflicts=('rbspy')

source=(
  "https://github.com/rbspy/rbspy/releases/download/v${pkgver}/rbspy-v${pkgver}-x86_64-unknown-linux-musl.tar.gz"
)
sha256sums=(
  'e287389fdeece3261fa200ccea66c7d74a87564186d243d08d7142a9a681b1e5'
)

package() {
  install -D -m755 "${srcdir}/rbspy" "${pkgdir}/usr/bin/rbspy"
}
