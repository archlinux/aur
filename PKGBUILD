# Maintainer: Marco Kage <marco.kage at outlook dot com>

pkgname=stash-bin
pkgver=0.20.2
pkgrel=1
pkgdesc="An organizer for your porn, written in Go"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/stashapp/stash'
license=('AGPL3')
provides=('stash')
depends=('ffmpeg')
source_x86_64=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux")
source_aarch64=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux-arm64v8")
source_armv7h=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux-arm32v7")
sha1sums_x86_64=('9e5034d40b21fecd22f59ff0725392e70710ccd8')
sha1sums_aarch64=('740ca3137552e8d88873917f7efb2e87b43a0309')
sha1sums_armv7h=('4fcfa2cd75c2206d68e4c57a64547d935b58f7c7')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/stash"
}
