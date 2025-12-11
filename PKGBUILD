# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=samplo-clap-bin
pkgver=1.2.4
pkgrel=1
pkgdesc="Headless Rust CLAP sfz instrument loader"
arch=('x86_64')
url="https://github.com/mlm-games/samplo-clap"
license=('MIT')
depends=('glibc')
source=("Samplo-${pkgver}.clap::https://github.com/mlm-games/samplo-clap/releases/download/v${pkgver}/Samplo-linux.clap")
sha256sums=('3e4479e7754c5830473b8f456f67d616c760716b8b018182e035545c92a61b59')

package() {
  install -Dm755 "${srcdir}/Samplo-${pkgver}.clap" "${pkgdir}/usr/lib/clap/Samplo.clap"
}
