# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=stash-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="An organizer for your porn, written in Go"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/stashapp/stash'
license=('AGPL3')
provides=('stash')
source_x86_64=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux")
source_aarch64=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux-arm64v8")
source_armv7h=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux-arm32v7")
sha256sums_x86_64=('6065c4073c89a2319b829d1474d90314386112b4b195a206ffb9fca4ddd467c5')
sha256sums_aarch64=('6065c4073c89a2319b829d1474d90314386112b4b195a206ffb9fca4ddd467c5')
sha256sums_armv7h=('6065c4073c89a2319b829d1474d90314386112b4b195a206ffb9fca4ddd467c5')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/stash"
}
