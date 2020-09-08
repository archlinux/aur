# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=stash-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="An organizer for your porn, written in Go"
arch=('x86_64')
url='https://github.com/stashapp/stash'
license=('AGPL3')
provides=('stash')
depends=('glibc')
source=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux")
sha256sums=('3766282abe014d8c0c315dca581e947f32a067d7a6e7e2c1fd383858bd0cbdb6')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/stash"
}