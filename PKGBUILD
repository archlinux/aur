# Maintainer: lludol <little dot corn3620 at fastmail dot com>
pkgname=perry
pkgver=0.5.18
pkgrel=1
pkgdesc="Compile TypeScript to native executables (official binary)"
arch=('x86_64')
url="https://github.com/PerryTS/perry"
license=('MIT')
source=("https://github.com/PerryTS/perry/releases/download/v${pkgver}/perry-linux-x86_64.tar.gz")
sha256sums=('a83f6324dcb959dc5d177e684d6cadc6aaf4a7b6c2580c06b619cf93442a4731')

package() {
  cd "${srcdir}"
  
  tar -xzf "perry-linux-x86_64.tar.gz"
  
  install -Dm755 "perry" "$pkgdir/usr/bin/perry"
  
  install -Dm644 "libperry_runtime.a" "$pkgdir/usr/lib/libperry_runtime.a"
  install -Dm644 "libperry_stdlib.a"  "$pkgdir/usr/lib/libperry_stdlib.a"
}
