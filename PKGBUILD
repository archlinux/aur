# Maintainer: lludol <little dot corn3620 at fastmail dot com>
pkgname=perry
pkgver=0.4.24
pkgrel=1
pkgdesc="Compile TypeScript to native executables (official binary)"
arch=('x86_64')
url="https://github.com/PerryTS/perry"
license=('MIT')
source=("https://github.com/PerryTS/perry/releases/download/v${pkgver}/perry-linux-x86_64.tar.gz")
sha256sums=('66d735ca0ba3e1c79a7378480be55aab0ce7707a56c4ba40b620c80c70ca64f0')

package() {
  cd "${srcdir}"
  
  tar -xzf "perry-linux-x86_64.tar.gz"
  
  install -Dm755 "perry" "$pkgdir/usr/bin/perry"
  
  install -Dm644 "libperry_runtime.a" "$pkgdir/usr/lib/libperry_runtime.a"
  install -Dm644 "libperry_stdlib.a"  "$pkgdir/usr/lib/libperry_stdlib.a"
}
