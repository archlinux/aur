# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>

pkgname=ytarchive-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Garbage Youtube livestream downloader"
arch=('x86_64')
url="https://github.com/Kethsar/ytarchive"
license=('MIT')
provides=('ytarchive')
conflicts=('ytarchive-git')
depends=('ffmpeg')
source=("https://github.com/Kethsar/ytarchive/releases/download/v${pkgver}/ytarchive_linux_amd64.zip")
sha256sums=('f334899cc710300b219f97a6e7e4a74735b5053dce20d25d39b1fdc05afbb4e2')

package() {
    install -Dm755 "${srcdir}/ytarchive" "${pkgdir}/usr/bin/ytarchive"
}
