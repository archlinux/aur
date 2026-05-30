# Maintainer: mmrmagno <mmr@marc-os.com>
pkgname=mangolib-bin
pkgver=0.1.1
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

sha256sums_x86_64=('8920e6a134fae04a5a7c060835372be6b82b9480ba25eeeca1b0e21b5a2d48d4')
sha256sums_aarch64=('cc478647be8f0a0ab3f2709be52f470288ac579cdc667569c0b026a6281b9a3d')

package() {
    install -Dm755 "${srcdir}/mangolib" "${pkgdir}/usr/bin/mangolib"
}
