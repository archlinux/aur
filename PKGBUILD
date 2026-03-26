# Maintainer: lludol <little dot corn3620 at fastmail dot com>
pkgname=perry
pkgver=0.4.15
pkgrel=1
pkgdesc="Compile TypeScript to native executables (official binary)"
arch=('x86_64')
url="https://github.com/PerryTS/perry"
license=('MIT')
source=("https://github.com/PerryTS/perry/releases/download/v${pkgver}/perry-linux-x86_64.tar.gz")
sha256sums=('b9b59c107cc4d81f70f295854358dd4c53cdac4937501da5fa055a4be7690eed')

package() {
  cd "${srcdir}"
  
  tar -xzf "perry-linux-x86_64.tar.gz"
  
  install -Dm755 "perry" "$pkgdir/usr/bin/perry"
  
  install -Dm644 "libperry_runtime.a" "$pkgdir/usr/lib/libperry_runtime.a"
  install -Dm644 "libperry_stdlib.a"  "$pkgdir/usr/lib/libperry_stdlib.a"
}
