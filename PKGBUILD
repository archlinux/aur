# Maintainer: Marco Kage <marco.kage at outlook dot com>

pkgname=stash-bin
pkgver=0.19.0
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
sha256sums_x86_64=('6957cba1c4e8f73fdcdbbd8b3347c69b63b0fe10a545b4ed4ad005252614c7dd')
sha256sums_aarch64=('0c6576f37c9aec5c463ba9a4441bc7abac607830c4837dfb057da450211f373d')
sha256sums_armv7h=('5c197da682d6b59eda32035cd9bd46c819641d1ae97ea81fcec5fe5c32dfe386')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/stash"
}
