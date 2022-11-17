# Maintainer: taotieren <admin@taotieren.com>

pkgname=n-m3u8dl-re-bin
pkgver=0.1.2_beta
pkgrel=1
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
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver/_/-}/N_m3u8DL-RE_Beta_linux-x64_20221117.tar.gz")
sha256sums=('ccd351cea1dcb644644e579ae37d7a381665410e70202d7baae717be8d89c9cf')

package() {
    install -Dm755 "${srcdir}/N_m3u8DL-RE_Beta_linux-x64/N_m3u8DL-RE"  "${pkgdir}/usr/bin/${pkgbase%-bin}"
}


