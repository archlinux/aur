# Maintainer: egoroff <egoroff@gmail.com>
pkgname=hash-calculator-bin
pkgver=6.1.4
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="Hash Calculator is the console tool that can calculate about 70 cryptographic hashes of strings and files."
url="https://github.com/aegoroff/hc"
license=('LGPL-3')
source_x86_64=("https://github.com/aegoroff/hc/releases/download/${pkgver}/hc-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/aegoroff/hc/releases/download/${pkgver}/hc-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('f5815b821f62b7dcf6b4fffc840382a73408066cbc3cb8e611de249e42ceb328')
sha256sums_aarch64=('e7d27411acc8a1cfa7989e05f9ac541e187b17f57830183efd6950cbe3bc0c0b')

build() {
  return 0
}

package() {
  install -Dm0755 "hc" "$pkgdir/usr/bin/hc"
  install -Dm0755 "l2h" "$pkgdir/usr/bin/l2h"
  install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/hc/LICENSE.txt"
}
