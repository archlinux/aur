# Maintainer: taotieren <admin@taotieren.com>

pkgname=n-m3u8dl-re-bin
pkgver=0.1.3_beta
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
options=()
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver/_/-}/N_m3u8DL-RE_Beta_linux-x64_20221202.tar.gz")
sha256sums=('506b0ceeb9c51af1d260a08cb26cc2be3500754d6641fe129711cae44add721b')

package() {
    install -Dm755 "${srcdir}/N_m3u8DL-RE_Beta_linux-x64/N_m3u8DL-RE"  "${pkgdir}/usr/bin/${pkgbase%-bin}"
}


