# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=rbspy-bin
pkgver=0.3.9
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
  '225c36583ae311933c40bf6e161f5988d686930626d79953c2fe25ca026e7fac'
)

package() {
  install -D -m755 "${srcdir}/rbspy" "${pkgdir}/usr/bin/rbspy"
}
