# Maintainer: mmrmagno <mmr@marc-os.com>
pkgname=mangolib-bin
pkgver=1.0.1
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

sha256sums_x86_64=('e4ed8e54db1b127ffec497d5ac57c21b3b24bb7d667bd6baad3ce666dbcb9be0')
sha256sums_aarch64=('a4dfbb92005f111d1caccdc1c1f80d341710d82415efb3dd3fcc0b8d6481c36b')

package() {
    install -Dm755 "${srcdir}/mangolib" "${pkgdir}/usr/bin/mangolib"
}
