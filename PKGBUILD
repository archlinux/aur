# Maintainer: mmrmagno <mmr@marc-os.com>
pkgname=mangolib-bin
pkgver=0.1.0
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

sha256sums_x86_64=('e43e299e099f81139ffd15c5346ef88aba77dbe78331b181bbc2a639836e2c3f')
sha256sums_aarch64=('f92207140e72d878d32090cda4453f462198eca0cca3c7463ac4a3ae95be3429')

package() {
    install -Dm755 "${srcdir}/mangolib" "${pkgdir}/usr/bin/mangolib"
}
