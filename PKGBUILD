# Maintainer: Roc Gwei <roc dot gui at foxmail dot com>

pkgname=clice-bin
pkgver=0.1.0.alpha.3
_tag=0.1.0-alpha.3
pkgrel=1
pkgdesc="A next-generation C++ language server for modern C++, focused on high performance and deep code intelligence."
url="https://github.com/clice-io/clice"
arch=(
  x86_64
)
license=(MIT)
depends=('clang')
conflicts=()

source_x86_64=("${url}/releases/download/v${_tag}/clice-x86_64-linux-gnu.tar.gz")

sha256sums_x86_64=('a0a9995decf1c4a1f51651e4ead0445f986f6486a31af5091894c2544bb5809b')

package() {
  cd "$srcdir"
  install -Dm755 clice "$pkgdir/usr/bin/clice"
}
