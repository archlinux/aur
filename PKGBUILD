# Maintainer: taotieren <admin@taotieren.com>

pkgname=n-m3u8dl-re-bin
_tagname=0.5.1-beta_osx-x64_20251029
_tagver=${_tagname//osx-x64/linux-x64}
_pkgver=${_tagver%%_linux*}
pkgver="${_pkgver//-/_}"
pkgrel=2
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
source=("${pkgname%-bin}-${_tagver}.tar.gz::${url}/releases/download/v${_pkgver}/N_m3u8DL-RE_v${_tagver}.tar.gz")
sha256sums=('2acce91b64af3ee676a32d1002e1382840d81f430e1b7f8d5b151ce1eb6fb590')

package() {
    install -Dm755 "${srcdir}/N_m3u8DL-RE" "${pkgdir}/usr/bin/${pkgbase%-bin}"
}
