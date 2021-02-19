# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=rbspy-bin
pkgver=0.3.13
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
  'c7113f6c003378ad8928e34e3ce0e44f0dfbd3bce043a2bfc1b52eeae7c90d83'
)

package() {
  install -D -m755 "${srcdir}/rbspy" "${pkgdir}/usr/bin/rbspy"
}
