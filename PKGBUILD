# Maintainer: egoroff <egoroff@gmail.com>
pkgname=hash-calculator-bin
pkgver=6.1.1
pkgrel=3
arch=('x86_64' 'aarch64')
pkgdesc="Hash Calculator is the console tool that can calculate about 70 cryptographic hashes of strings and files."
url="https://github.com/aegoroff/hc"
license=('LGPL-3')
source_x86_64=("https://github.com/aegoroff/hc/releases/download/${pkgver}/hc-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/aegoroff/hc/releases/download/${pkgver}/hc-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('09264d9114fdbf32c207cdaeadbe4670a1b61bf17cf11b81be6226a3c168ec1e')
sha256sums_aarch64=('269b8792880cdc44f0de030bef02b4187f4d3a25e3a59fd160b86d883efb3f05')

build() {
  return 0
}

package() {
  install -Dm0755 "hc" "$pkgdir/usr/bin/hc"
  install -Dm0755 "l2h" "$pkgdir/usr/bin/l2h"
  install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/hc/LICENSE.txt"
}
