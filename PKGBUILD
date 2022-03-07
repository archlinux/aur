# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>

pkgname=ytarchive-bin
pkgver=0.3.1.20220307.181234
pkgrel=1
pkgdesc="Garbage Youtube livestream downloader"
arch=('x86_64')
url="https://github.com/Kethsar/ytarchive"
license=('MIT')
provides=('ytarchive')
conflicts=('ytarchive-git')
depends=('ffmpeg')
source=("ytarchive-${pkgver}.zip::https://github.com/Kethsar/ytarchive/releases/download/latest/ytarchive_linux_amd64.zip")
sha256sums=('c2f6ab024d454d4201120ed38b520e552cd95cca7ca171c81adc526788a061fb')

package() {
    install -Dm755 "${srcdir}/ytarchive" "${pkgdir}/usr/bin/ytarchive"
}
