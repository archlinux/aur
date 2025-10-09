# Maintainer: Roc Gwei <roc dot gui at foxmail dot com>

pkgname=clice-bin
pkgver=0.1.0.alpha.1
tag=0.1.0-alpha.1
pkgrel=1
pkgdesc="A next-generation C++ language server for modern C++, focused on high performance and deep code intelligence."
url="https://github.com/clice-io/clice"
arch=(
  x86_64
)
license=(MIT)
depends=('clang')
conflicts=()

source_x86_64=("${url}/releases/download/v${tag}/clice-x86_64-linux-gnu.tar.xz")

sha256sums_x86_64=('65b51f54aa66940e5f1c895336b38637f6d3c6f06196fad348e07634b2a6e49b')

package() {
  cd "$srcdir"
  install -Dm755 clice "$pkgdir/usr/bin/clice"
}
