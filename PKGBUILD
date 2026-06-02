# Maintainer: mmrmagno <mmr@marc-os.com>
pkgname=mangolib-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Music library manager, downloader, and iPod sync tool"
arch=('x86_64' 'aarch64')
url="https://github.com/mmrmagno/mangolib"
license=('AGPL-3.0-only')
depends=('ffmpeg' 'rsync')
provides=('mangolib')
conflicts=('mangolib')

source_x86_64=("mangolib::${url}/releases/download/v${pkgver}/mangolib-linux-amd64")
source_aarch64=("mangolib::${url}/releases/download/v${pkgver}/mangolib-linux-arm64")

sha256sums_x86_64=('31976e25ffa3b6c21e08e5988363f797182fa5c3bdfd91129dbe3c3d95bdb6f4')
sha256sums_aarch64=('ae70ccdbfe2993b5d5d9b90d0538261032fa1ab0121407dc4d437b0740087f57')

package() {
    install -Dm755 "${srcdir}/mangolib" "${pkgdir}/usr/bin/mangolib"
}
