# Maintainer: Yuzuki <lxf74663@gmail.com>

pkgname=qqmusic-tui-bin
_pkgname=qqmusic-tui
pkgver=0.1.1
pkgrel=1
pkgdesc="Linux terminal QQ Music player (.NET 10 Native AOT pre-built package)"
arch=('x86_64' 'aarch64')
url="https://github.com/Viemean/qqmusiclinux/tree/tui"
license=('MIT')
depends=(
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
)
optdepends=(
    'ffmpeg: cover art extraction and display'
    'imagemagick: rounded corner cover rendering'
)
provides=('qqmusic-tui')
conflicts=('qqmusic-tui')

source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/Viemean/qqmusiclinux/releases/download/v${pkgver}/${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
source_aarch64=("${pkgname}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst::https://github.com/Viemean/qqmusiclinux/releases/download/v${pkgver}/${pkgname}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst")
sha256sums_x86_64=('8c31c3568d21303d85febc1ac0b402afa83c41fb5cbf6dd94f62c8199c3a987f')
sha256sums_aarch64=('94708b43270a54f27e73383c4b1f5250a09c830d8e7cd4b0486fde68627ba2ca')

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/"
}
