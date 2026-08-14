# Maintainer: egoroff <egoroff@gmail.com>
pkgname=hash-calculator-bin
pkgver=6.0.1
pkgrel=1
arch=('x86_64')
pkgdesc="Hash Calculator is the console tool that can calculate about 50 cryptographic hashes of strings and files."
url="https://github.com/aegoroff/hc"
license=('LGPL-3')
source=("https://github.com/aegoroff/hc/releases/download/${pkgver}/hc-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('235a972f10d16481359931d2c5390beb9a1ae057ed7859280612c0cc5f898f3a')

build() {
  return 0
}

package() {
  install -Dm0755 "hc" "$pkgdir/usr/bin/hc"
  install -Dm0755 "l2h" "$pkgdir/usr/bin/l2h"
  install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/hc/LICENSE.txt"
}
