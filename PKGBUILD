# Maintainer: taotieren <admin@taotieren.com>

pkgname=n-m3u8dl-re-bin
pkgver=0.3.0_beta
pkgrel=1
epoch=
pkgdesc="Cross-Platform, beautiful and powerful stream downloader for DASH/HLS. "
arch=('x86_64')
url="https://github.com/nilaoda/N_m3u8DL-RE"
license=('MIT')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
replaces=()
depends=(
    glibc)
makedepends=()
backup=()
options=('!strip' '!debug' '!lto')
_time=20241203
source=("${pkgname%-bin}-${pkgver/_/-}.tar.gz::${url}/releases/download/v${pkgver/_/-}/N_m3u8DL-RE_v${pkgver%_beta}-Beta_linux-x64_${_time}.tar.gz")
sha256sums=('35205154911e8505a7031999b0e35120cda4e2433d964f3a66d6ee9f322398ba')

package() {
    install -Dm755 "${srcdir}/N_m3u8DL-RE" "${pkgdir}/usr/bin/${pkgbase%-bin}"
}
