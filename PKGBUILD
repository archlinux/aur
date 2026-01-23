# Maintainer: Martin Kröner <aur@kroner.dev>

pkgname=unfrl-dug-bin
pkgver=0.0.100
pkgrel=1
pkgdesc='A powerful global DNS progagation checker that can output in a variety of formats.'
arch=('x86_64')
url='https://git.unfrl.com/Unfrl/dug'
license=('MIT')
options=(!debug !strip)
provides=('dug')
conflicts=('dug')
source=("$url"/releases/download/"$pkgver"/dug-linux-x64)
sha256sums=('67cb6bf86f93f1731e1a68571afc05129853ce6eb87a48872a15a6c5878c26d2')

package() {
  install -Dm755 dug-linux-x64 "$pkgdir"/usr/bin/dug
}
