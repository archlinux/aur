# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=rbspy-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Sampling profiler for Ruby"
arch=('x86_64')
url="https://rbspy.github.io"
license=('MIT')
makedepends=('fakeroot')
conflicts=('rbspy')

source=(
  "rbspy-v${pkgver}-x86_64-musl.tar.gz::https://github.com/rbspy/rbspy/releases/download/v${pkgver}/rbspy-x86_64-musl.tar.gz"
)
sha256sums=(
  '564d4d21b7d02d9fe8920faa19c3b0a5d2b40bd3605b7b2ca03c394a5894a21a'
)

package() {
  install -D -m755 "${srcdir}/rbspy-x86_64-musl" "${pkgdir}/usr/bin/rbspy"
}
