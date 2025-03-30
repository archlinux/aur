# Maintainer: Martin Kröner <aur@kroner.dev>

pkgname=unfrl-dug-bin
pkgver=0.0.94
pkgrel=1
pkgdesc='A powerful global DNS progagation checker that can output in a variety of formats.'
arch=('x86_64')
url='https://github.com/unfrl/dug'
license=('MIT')
options=(!debug !strip)
provides=('dug')
conflicts=('dug')
source=("$url"/releases/download/"$pkgver"/dug-linux-x64)
sha256sums=('c098d2fe6616e890d154b8a30bda5fcd3514778f3df2828c0662dde9f6b447fa')

package() {
  install -Dm755 dug-linux-x64 "$pkgdir"/usr/bin/dug
}
