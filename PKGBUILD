# Maintainer: taotieren <admin@taotieren.com>

pkgname=n-m3u8dl-re-bin
pkgver=0.2.1_beta
pkgrel=1
epoch=
pkgdesc="Cross-Platform, beautiful and powerful stream downloader for DASH/HLS. "
arch=('x86_64')
url="https://github.com/nilaoda/N_m3u8DL-RE"
license=('MIT')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
replaces=()
depends=()
makedepends=()
backup=()
options=('!strip' '!debug' '!lto')
_time=20240828
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver/_/-}/N_m3u8DL-RE_Beta_linux-x64_${_time}.tar.gz")
sha256sums=('4cea485a17a5bb91a34b310bb5a5d385a23b69cec970753053d83b25b466baea')

package() {
    install -Dm755 "${srcdir}/N_m3u8DL-RE_Beta_linux-x64/N_m3u8DL-RE" "${pkgdir}/usr/bin/${pkgbase%-bin}"
}
