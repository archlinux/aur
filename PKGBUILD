# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=rbspy-bin
pkgver=0.3.8
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
  'd8d5a1c9e0235744f3c9d5d83cb987a4423136c9ee55ed9c82664bf8c82ed113'
)

package() {
  install -D -m755 "${srcdir}/rbspy" "${pkgdir}/usr/bin/rbspy"
}
