# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=rbspy-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="Sampling profiler for Ruby"
arch=('x86_64')
url="https://rbspy.github.io"
license=('MIT')
provides=('rbspy')
conflicts=('rbspy')
source=("https://github.com/rbspy/rbspy/releases/download/v${pkgver}/rbspy-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha512sums=('1a9b158c66eed8cf02aeb419aad9af41a13d191c1a54641d7d0dbe7da699c33eeb19096cfd39e9493cb5f99ea3f17dbe886b29def8cf77e570c9e90a495b57e6')

package() {
  install -D -m755 "${srcdir}/rbspy" "${pkgdir}/usr/bin/rbspy"
}
