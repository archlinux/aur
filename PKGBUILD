# Maintainer: egoroff <egoroff@gmail.com>
pkgname=hash-calculator-bin
pkgver=6.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="Hash Calculator is the console tool that can calculate about 70 cryptographic hashes of strings and files."
url="https://github.com/aegoroff/hc"
license=('LGPL-3')
source_x86_64=("https://github.com/aegoroff/hc/releases/download/${pkgver}/hc-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/aegoroff/hc/releases/download/${pkgver}/hc-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('346895eaf4901aabcfcb0c075e182c14126df418f5e055faa00cb4b8bc16f1c6')
sha256sums_aarch64=('658d143e106dfa2407578c9decb9eeb4b0cab968d402faa619a9866a0938002f')

build() {
  return 0
}

package() {
  install -Dm0755 "hc" "$pkgdir/usr/bin/hc"
  install -Dm0755 "l2h" "$pkgdir/usr/bin/l2h"
  install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/hc/LICENSE.txt"
}
