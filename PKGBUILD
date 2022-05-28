# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>

pkgname=ytarchive-bin
pkgver=0.3.1.20220528.142851
pkgrel=1
pkgdesc="Garbage Youtube livestream downloader"
arch=('x86_64')
url="https://github.com/Kethsar/ytarchive"
license=('MIT')
provides=('ytarchive')
conflicts=('ytarchive-git')
depends=('ffmpeg')
source=("ytarchive-${pkgver}.zip::https://github.com/Kethsar/ytarchive/releases/download/latest/ytarchive_linux_amd64.zip")
sha256sums=('ba115c02a7b95a2729cf4d3cc961aa9d496f18eddb4a5128d304e3ff3ba02494')

package() {
    install -Dm755 "${srcdir}/ytarchive" "${pkgdir}/usr/bin/ytarchive"
}
