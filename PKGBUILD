# Maintainer: Marco Kage <marco.kage at outlook dot com>

pkgname=stash-bin
pkgver=0.20.1
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
sha1sums_x86_64=('8e3cd51ae6642770e1c4f69dfc4dbbfbc5808219')
sha1sums_aarch64=('a414c8126357a6424ecba036c9440980caa3f0f2')
sha1sums_armv7h=('e41767ad9c21ad0d65faee573b4161ef3f7d6840')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/stash"
}
