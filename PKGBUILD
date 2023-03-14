# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mapeo-desktop-bin
_pkgname=mapeo-desktop
pkgver=5.6.0
pkgrel=1
pkgdesc="Local-first mapping and monitoring in remote environments"
arch=('x86_64')
url="https://mapeo.app/"
_githuburl="https://github.com/digidem/mapeo-desktop"
license=('GPL3')
conflicts=(mapeo-desktop)
depends=(gtk3 libxss libsodium nodejs-lts-fermium alsa-lib python nss at-spi2-core)
options=()
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Install_Mapeo_v${pkgver}_linux.deb")
sha512sums=('fad6cabfc264fc8d1bc156ae011fdda6f92af1de6f552d1fa8f97e0b771a4a8c3334774cf4c10b9e7a205d2195c13f78eba1978135ff5e6b2b49de814208d94e')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
}