# Maintainer: lludol <little dot corn3620 at fastmail dot com>
pkgname=perry
pkgver=0.4.2
pkgrel=1
pkgdesc="Compile TypeScript to native executables (official binary)"
arch=('x86_64')
url="https://github.com/PerryTS/perry"
license=('MIT')
source=("https://github.com/PerryTS/perry/releases/download/v${pkgver}/perry-linux-x86_64.tar.gz")
sha256sums=('278912f7a99552bf9cd31b405b0f9fff7204354ed662d29fa4c91219cf4627f3')

package() {
  cd "${srcdir}"
  
  tar -xzf "perry-linux-x86_64.tar.gz"
  
  install -Dm755 "perry" "$pkgdir/usr/bin/perry"
  
  install -Dm644 "libperry_runtime.a" "$pkgdir/usr/lib/libperry_runtime.a"
  install -Dm644 "libperry_stdlib.a"  "$pkgdir/usr/lib/libperry_stdlib.a"
}
