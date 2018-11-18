# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=rbspy-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Sampling profiler for Ruby"
arch=('x86_64')
url="https://rbspy.github.io"
license=('MIT')
conflicts=('rbspy')

source=("https://github.com/rbspy/rbspy/releases/download/v${pkgver}/rbspy-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('63cb49e962372cd8a06c28863753ca5f457ca00486814461d82465f27162c2b9')

package() {
  install -D -m755 "${srcdir}/rbspy" "${pkgdir}/usr/bin/rbspy"
}
