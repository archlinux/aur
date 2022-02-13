# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=stash-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="An organizer for your porn, written in Go"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/stashapp/stash'
license=('AGPL3')
provides=('stash')
source_x86_64=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux")
source_aarch64=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux-arm64v8")
source_armv7h=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux-arm32v7")
sha256sums_x86_64=('60c0c07b2ca4dfe773adada24375c7b3a83679d09731329628dacada3bccf708')
sha256sums_aarch64=('60c0c07b2ca4dfe773adada24375c7b3a83679d09731329628dacada3bccf708')
sha256sums_armv7h=('60c0c07b2ca4dfe773adada24375c7b3a83679d09731329628dacada3bccf708')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/stash"
}
