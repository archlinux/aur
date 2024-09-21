# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>

pkgname=ytarchive-bin
pkgver=0.5.0.20240920.204333
pkgrel=1
pkgdesc="Garbage Youtube livestream downloader"
arch=('x86_64')
url="https://github.com/Kethsar/ytarchive"
license=('MIT')
provides=('ytarchive')
conflicts=('ytarchive-git')
depends=('ffmpeg')
source=("ytarchive-${pkgver}.zip::https://github.com/Kethsar/ytarchive/releases/download/latest/ytarchive_linux_amd64.zip")
sha256sums=('38ec377d0eb7e9c3bcd2a9191de9d9d43c77bca980139f4e581c18dcb57e1714')

package() {
    install -Dm755 "${srcdir}/ytarchive" "${pkgdir}/usr/bin/ytarchive"
}
