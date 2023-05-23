# Maintainer: taotieren <admin@taotieren.com>

pkgname=n-m3u8dl-re-bin
pkgver=0.1.5.3_beta
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
_time=20230323
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver/_/-}/N_m3u8DL-RE_Beta_linux-x64_${_time}.tar.gz")
sha256sums=('906219641176ad40ac9cefde26a40c34a414aa82d6173e2cdaeb8c301cef4f52')

package() {
    install -Dm755 "${srcdir}/N_m3u8DL-RE_Beta_linux-x64/N_m3u8DL-RE"  "${pkgdir}/usr/bin/${pkgbase%-bin}"
}


