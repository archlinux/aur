# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=rbspy-bin
pkgver=0.9.0
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
  '42a8e236ef2f6bf8887ea4d9d7540b6297ed9c8d08a1fcfe401a90b193fac40f'
)

package() {
  install -D -m755 "${srcdir}/rbspy-x86_64-musl" "${pkgdir}/usr/bin/rbspy"
}
