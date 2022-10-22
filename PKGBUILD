# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=stash-bin
pkgver=0.17.1
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
sha256sums_x86_64=('6bd6034895b42721b4cd93a1f83484724177231bc48104921fb2a583eabe0f78')
sha256sums_aarch64=('6bd6034895b42721b4cd93a1f83484724177231bc48104921fb2a583eabe0f78')
sha256sums_armv7h=('6bd6034895b42721b4cd93a1f83484724177231bc48104921fb2a583eabe0f78')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/stash"
}
