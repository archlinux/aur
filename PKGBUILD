# Maintainer: Roc Gwei <roc dot gui at foxmail dot com>

pkgname=clice-bin
pkgver=0.1.0.alpha.2
_tag=0.1.0-alpha.2
pkgrel=1
pkgdesc="A next-generation C++ language server for modern C++, focused on high performance and deep code intelligence."
url="https://github.com/clice-io/clice"
arch=(
  x86_64
)
license=(MIT)
depends=('clang')
conflicts=()

source_x86_64=("${url}/releases/download/v${_tag}/clice-x86_64-linux-gnu.tar.xz")

sha256sums_x86_64=('ba5934282aacd26ae0063b75d1265b87dec7bdbb29b775ecfe80b26a675adc94')

package() {
  cd "$srcdir"
  install -Dm755 clice "$pkgdir/usr/bin/clice"
}
