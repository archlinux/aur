# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tatayoyoh-deezer-tui-bin
pkgver=1.21.1
pkgrel=1
pkgdesc="Deezer music TUI with included background player"
arch=('x86_64' 'aarch64')
url="https://github.com/Tatayoyoh/deezer-tui"
license=('WTFPL')
depends=('alsa-lib' 'glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/deezer-tui-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/deezer-tui-linux-aarch64")
sha256sums_x86_64=('9dcd0b50e7ae6512a54b76993ed8f03dce27d11a057663f80899f546d649f4df')
sha256sums_aarch64=('24b844308d3c83b496371b7554cd5ac9da912f41a65628a371ff60074f620fa3')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/deezer-tui"
}
