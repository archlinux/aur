# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=rbspy-bin
pkgver=0.12.0
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
  '1b613dac496f040a7af78644ac2323069dc7d6fa2da57d18226bb4b94c02f0e3'
)

package() {
  install -D -m755 "${srcdir}/rbspy-x86_64-musl" "${pkgdir}/usr/bin/rbspy"
}
