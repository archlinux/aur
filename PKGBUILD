# Maintainer: egoroff <egoroff@gmail.com>
pkgname=hash-calculator-bin
pkgver=6.1.3
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="Hash Calculator is the console tool that can calculate about 70 cryptographic hashes of strings and files."
url="https://github.com/aegoroff/hc"
license=('LGPL-3')
source_x86_64=("https://github.com/aegoroff/hc/releases/download/${pkgver}/hc-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/aegoroff/hc/releases/download/${pkgver}/hc-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('aae78b7b5176e25fe53f5b5fba454f00afe57457f09c7949a5c2133b5fdfd8c4')
sha256sums_aarch64=('3d05a40e5cc0de87c52bcfaf31f274083059731924b3d2fcdbc92bd4a9af528e')

build() {
  return 0
}

package() {
  install -Dm0755 "hc" "$pkgdir/usr/bin/hc"
  install -Dm0755 "l2h" "$pkgdir/usr/bin/l2h"
  install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/hc/LICENSE.txt"
}
