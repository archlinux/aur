# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=stash-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="An organizer for your porn, written in Go"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/stashapp/stash'
license=('AGPL3')
provides=('stash')
source_x86_64=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux")
source_aarch64=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux-arm64v8")
source_armv7h=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux-arm32v7")
sha256sums_x86_64=('a1e38a0054a36a6688f75342f0145f0f9f68a9d949eedf90b3b0e2cc7dacc4b3')
sha256sums_aarch64=('a1e38a0054a36a6688f75342f0145f0f9f68a9d949eedf90b3b0e2cc7dacc4b3')
sha256sums_armv7h=('a1e38a0054a36a6688f75342f0145f0f9f68a9d949eedf90b3b0e2cc7dacc4b3')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/stash"
}
