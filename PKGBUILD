# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=rbspy-bin
pkgver=0.6.0
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
  '366795df131d7fbfe2ace3537d3ebcc5735d794b92fae463d342f79b1214c28d'
)

package() {
  install -D -m755 "${srcdir}/rbspy-x86_64-musl" "${pkgdir}/usr/bin/rbspy"
}
