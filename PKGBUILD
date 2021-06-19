# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=rbspy-bin
pkgver=0.7.0
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
  'ae33e0e6f50c3df69b45faf2aeb5ff4089c2cadd388574d0308309854abdcc56'
)

package() {
  install -D -m755 "${srcdir}/rbspy-x86_64-musl" "${pkgdir}/usr/bin/rbspy"
}
