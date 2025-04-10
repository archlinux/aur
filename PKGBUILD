# Maintainer: hu3rror <hu3rror@protonmail.com>
pkgname=subs-check-bin
pkgver=2.1.3
pkgrel=1
pkgdesc="Advanced subscription tool for conversion, merging, node testing, speed measurement, renaming, and exporting to multiple formats (Clash/Meta/Base64/Quantumult X etc.)"
arch=('x86_64' 'aarch64')
url="https://github.com/beck-8/subs-check"
license=('GPL-3.0')
provides=('subs-check')
conflicts=('subs-check')
source_x86_64=("https://github.com/beck-8/subs-check/releases/download/v${pkgver}/subs-check_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/beck-8/subs-check/releases/download/v${pkgver}/subs-check_Linux_aarch64.tar.gz")
sha256sums_x86_64=('99d23b50d2b787b9c4d7a7bbd70c78b4a6d8772327837fab6e7d15e1b46f82f1')
sha256sums_aarch64=('03f5a37eb7d649e56bb3e117d9958de271d45c105f4026244ed8c254a011ce3a')

package() {
  cd "$srcdir"
  
  # Install binary
  install -Dm755 "subs-check" "$pkgdir/usr/bin/subs-check"
  
  # Install license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install readme
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
