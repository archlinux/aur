# Maintainer: InodeLabs
pkgname=fern-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Terminal UI markdown notes and knowledge manager. Pre-compiled."
url="https://codeberg.org/InodeLabs/fern"
arch=('x86_64' 'aarch64' 'armv7h')
license=('AGPL-3.0-only')
provides=('fern')
conflicts=('fern')

source_x86_64=("fern_${pkgver}_linux_amd64.tar.gz::https://codeberg.org/InodeLabs/fern/releases/download/v${pkgver}/fern_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("fern_${pkgver}_linux_arm64.tar.gz::https://codeberg.org/InodeLabs/fern/releases/download/v${pkgver}/fern_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("fern_${pkgver}_linux_arm.tar.gz::https://codeberg.org/InodeLabs/fern/releases/download/v${pkgver}/fern_${pkgver}_linux_arm.tar.gz")

sha256sums_x86_64=('e99c7bd1d4b1fc7bb15b35730aa8c20ed2ead4209170d5832d01ba7aa84148ec')
sha256sums_aarch64=('9281c5a642c4a1b570db8d67ca1bbe1c3b2d8fb39c5978dec9fcf300947effb3')
sha256sums_armv7h=('7bf4db9d7202caa0be522c77949d187a9cbbd204707fed9af15def5989bbec52')

package() {
    install -Dm755 "${srcdir}/fern" "${pkgdir}/usr/bin/fern"
}
