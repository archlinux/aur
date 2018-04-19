# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=rbspy-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="Sampling profiler for Ruby"
arch=('x86_64')
url="https://rbspy.github.io"
license=('MIT')
provides=('rbspy')
conflicts=('rbspy')
source=("https://github.com/rbspy/rbspy/releases/download/v${pkgver}/rbspy-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha512sums=('d3df312008a567afe714ec5ccde98cbba03ff9ec0668eaae7726f9d14713543457e632645e5b52f60aa370f8acc90234f3f28b7add7a2827d0084e408a87b301')

package() {
  install -D -m755 "${srcdir}/rbspy" "${pkgdir}/usr/bin/rbspy"
}
