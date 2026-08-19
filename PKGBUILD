# Maintainer: egoroff <egoroff@gmail.com>
pkgname=hash-calculator-bin
pkgver=6.0.2
pkgrel=1
arch=('x86_64')
pkgdesc="Hash Calculator is the console tool that can calculate about 50 cryptographic hashes of strings and files."
url="https://github.com/aegoroff/hc"
license=('LGPL-3')
source=("https://github.com/aegoroff/hc/releases/download/${pkgver}/hc-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('ec36135691cce38f8d9e7bf7c9b509949fff9c6988fffcce4974d8eb9c21ffa8')

build() {
  return 0
}

package() {
  install -Dm0755 "hc" "$pkgdir/usr/bin/hc"
  install -Dm0755 "l2h" "$pkgdir/usr/bin/l2h"
  install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/hc/LICENSE.txt"
}
