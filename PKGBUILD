# Maintainer: taotieren <admin@taotieren.com>

pkgname=n-m3u8dl-re-bin
pkgver=0.1.6_beta
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
_time=20230412
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver/_/-}/N_m3u8DL-RE_Beta_linux-x64_${_time}.tar.gz")
sha256sums=('c300a3354a870fc1d6294e02831f9088b177437dddf287ac0b230840ab61b516')

package() {
    install -Dm755 "${srcdir}/N_m3u8DL-RE_Beta_linux-x64/N_m3u8DL-RE"  "${pkgdir}/usr/bin/${pkgbase%-bin}"
}


