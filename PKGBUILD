# Maintainer: egoroff <egoroff@gmail.com>
pkgname=hash-calculator-bin
pkgver=6.1.2
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="Hash Calculator is the console tool that can calculate about 70 cryptographic hashes of strings and files."
url="https://github.com/aegoroff/hc"
license=('LGPL-3')
source_x86_64=("https://github.com/aegoroff/hc/releases/download/${pkgver}/hc-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/aegoroff/hc/releases/download/${pkgver}/hc-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('06abdfae9920bdea3b80d71433c6e55f91e3c6ea62240aca04333aed73ad21d3')
sha256sums_aarch64=('2baad700f53eed279cdafe4e50fc8c4f1efd75f570ca3dd26b74ec4643359639')

build() {
  return 0
}

package() {
  install -Dm0755 "hc" "$pkgdir/usr/bin/hc"
  install -Dm0755 "l2h" "$pkgdir/usr/bin/l2h"
  install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/hc/LICENSE.txt"
}
