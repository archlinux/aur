# Maintainer: taotieren <admin@taotieren.com>

pkgname=n-m3u8dl-re-bin
pkgver=0.1.5_beta
pkgrel=0
epoch=
pkgdesc="Cross-Platform, beautiful and powerful stream downloader for DASH/HLS. "
arch=('x86_64')
url="https://github.com/nilaoda/N_m3u8DL-RE"
license=('MIT')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
replaces=()
depends=(curl zlib krb5)
makedepends=()
backup=()
options=('!strip')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver/_/-}/N_m3u8DL-RE_Beta_linux-x64_20221212.tar.gz")
sha256sums=('5f39c3b5642b07fb5940f71607d3baeb0a1b16cb182544dc4ecb536e9ec0c9d5')

package() {
    install -Dm755 "${srcdir}/N_m3u8DL-RE_Beta_linux-x64/N_m3u8DL-RE"  "${pkgdir}/usr/bin/${pkgbase%-bin}"
}


