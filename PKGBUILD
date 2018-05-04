# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=rbspy-bin
pkgver=0.2.9
pkgrel=1
pkgdesc="Sampling profiler for Ruby"
arch=('x86_64')
url="https://rbspy.github.io"
license=('MIT')
conflicts=('rbspy')

source=("https://github.com/rbspy/rbspy/releases/download/v${pkgver}/rbspy-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha512sums=('516009ac0400cd726b23fbdd158510b89adc624022120030ea7c7b18978fd7c0d90023c153596a61328027854a1c7bf5c7c69d99d17509be9350329fc1ef9b01')

package() {
  install -D -m755 "${srcdir}/rbspy" "${pkgdir}/usr/bin/rbspy"
}
