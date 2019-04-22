# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=wasmer-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Universal WebAssembly runtime'
arch=(x86_64)
license=(MIT)
url='https://wasmer.io/'
depends=()
conflicts=(wasmer)
provides=(wasmer)
source=(
  "https://github.com/wasmerio/wasmer/releases/download/${pkgver}/wasmer-linux-amd64.tar.gz"
  "https://raw.githubusercontent.com/wasmerio/wasmer/0.3.0/LICENSE"
  logo.sh
)
sha512sums=(SKIP SKIP SKIP)

package() {
  cd "$srcdir"
  source logo.sh
  install -Dm755 bin/wasmer "$pkgdir"/usr/bin/wasmer
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
