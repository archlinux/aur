# Maintainer: lae <lae(at)lae(dot)is>

pkgname=ytarchive-bin
pkgver=0.5.0.20251219.154738
pkgrel=1
pkgdesc="Garbage Youtube livestream downloader"
arch=('x86_64')
url="https://github.com/Kethsar/ytarchive"
license=('MIT')
provides=('ytarchive')
conflicts=('ytarchive-git')
depends=('ffmpeg')
source=("ytarchive-${pkgver}.zip::https://github.com/Kethsar/ytarchive/releases/download/latest/ytarchive_linux_amd64.zip")
sha256sums=('f44afb43d90bee015c39af5c7d22a4b3b8bf18ef39ab58bd58990f9158de813e')

package() {
    install -Dm755 "${srcdir}/ytarchive" "${pkgdir}/usr/bin/ytarchive"
}
