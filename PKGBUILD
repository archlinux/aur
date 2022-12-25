# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>

pkgname=ytarchive-bin
pkgver=0.3.2.20221211.043353
pkgrel=1
pkgdesc="Garbage Youtube livestream downloader"
arch=('x86_64')
url="https://github.com/Kethsar/ytarchive"
license=('MIT')
provides=('ytarchive')
conflicts=('ytarchive-git')
depends=('ffmpeg')
source=("ytarchive-${pkgver}.zip::https://github.com/Kethsar/ytarchive/releases/download/latest/ytarchive_linux_amd64.zip")
sha256sums=('457e8d8562c89063cee84c002ebf9ed93191c8b6a3f0395d40be2da6b8643563')

package() {
    install -Dm755 "${srcdir}/ytarchive" "${pkgdir}/usr/bin/ytarchive"
}
