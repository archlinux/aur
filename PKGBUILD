# Maintainer: XYenon <i at xyenon dot bid>

pkgname=go-cqhttp-bin

pkgver=1.0.0_rc5
pkgrel=1

pkgdesc='Lightweight, native cross-platform implementation of cqhttp in Golang.'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/Mrs4s/go-cqhttp/releases'
license=('AGPL3')
install=go-cqhttp-bin.install

optdepends=('ffmpeg: support voice sending in any format')

provides=('go-cqhttp')

origin_pkgver="v${pkgver//_/-}"

source_i686=("${pkgname}-i686-${origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${origin_pkgver}/go-cqhttp_linux_386.tar.gz")
source_x86_64=("${pkgname}-x86_64-${origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${origin_pkgver}/go-cqhttp_linux_amd64.tar.gz")
source_armv7h=("${pkgname}-armv7h-${origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${origin_pkgver}/go-cqhttp_linux_armv7.tar.gz")
source_aarch64=("${pkgname}-aarch64-${origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${origin_pkgver}/go-cqhttp_linux_arm64.tar.gz")

sha256sums_i686=('fe0c06d67ab6cac3fa826d2c2039bb098505e720b094903107098df1ea12a103')
sha256sums_x86_64=('26c5f2f4c5d5111a870c2b07df80e832ad6bc4e6087fde9bee1788099365ecac')
sha256sums_armv7h=('b86d55768d1e9ffb7438a7d9d189c6da0c6bf302841506a9e769525b97735040')
sha256sums_aarch64=('a722514a5ecab90eb38e8b2c81d0fc604c898552cb73e527484d2ee29f606009')

package() {
    cd "${srcdir}"
    install -Dm755 'go-cqhttp' "${pkgdir}/usr/bin/go-cqhttp"
}
