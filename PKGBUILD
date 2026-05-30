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

sha256sums_x86_64=('79e75bd85b8c98c95dcc32a2931a637fc0e2e111c83ce11a9acb247532298519')
sha256sums_aarch64=('2ad7dfcc33c5ff6779c92ef9015446cef267684a52cc2c2231c6a494664d1468')

package() {
    install -Dm755 "${srcdir}/mangolib" "${pkgdir}/usr/bin/mangolib"
}
