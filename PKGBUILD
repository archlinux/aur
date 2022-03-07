# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>

pkgname=ytarchive-bin
pkgver=0.3.1.20220307.042216
pkgrel=1
pkgdesc="Garbage Youtube livestream downloader"
arch=('x86_64')
url="https://github.com/Kethsar/ytarchive"
license=('MIT')
provides=('ytarchive')
conflicts=('ytarchive-git')
depends=('ffmpeg')
source=("ytarchive-${pkgver}.zip::https://github.com/Kethsar/ytarchive/releases/download/latest/ytarchive_linux_amd64.zip")
sha256sums=('836f182400403c9c0beb80b29da1bc5492b66a7fd2be8d399f9bb28eceeccfa7')

package() {
    install -Dm755 "${srcdir}/ytarchive" "${pkgdir}/usr/bin/ytarchive"
}
