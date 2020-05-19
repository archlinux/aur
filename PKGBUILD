# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=stash-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="An organizer for your porn, written in Go"
arch=('x86_64')
url='https://github.com/stashapp/stash'
license=('AGPL3')
provides=('stash')
depends=('glibc')
source=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux")
sha256sums=('01b69a6a1a615424ca31f289d505d1d91b6dc356ce022cb102afb8205ffc5729')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/stash"
}