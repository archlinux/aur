# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=stash-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="An organizer for your porn, written in Go"
arch=('x86_64')
url='https://github.com/stashapp/stash'
license=('AGPL3')
provides=('stash')
source=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux")
sha256sums=('573be72d9808d9c1c42f7b48574ea58d8eb12a71adb6eec1e89d46b43ecf122d')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/stash"
}
