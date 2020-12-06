# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=stash-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="An organizer for your porn, written in Go"
arch=('x86_64')
url='https://github.com/stashapp/stash'
license=('AGPL3')
provides=('stash')
source=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux")
sha256sums=('a3bfc80389675d31ac1d47726d464a36151a5b963e5271c9d3d3f2ed320ee7fd')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/stash"
}
