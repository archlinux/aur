# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=netpad-bin
_pkgname=netpad
pkgver=0.1.0
pkgrel=1
pkgdesc="A cross-platform C# editor and playground."
arch=('x86_64')
url="https://github.com/tareqimbasher/NetPad"
license=('MIT')
providers="tareqimbasher"
conflits=(netpad)
depends=(at-spi2-core gtk3 alsa-lib nss)
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-amd64.deb")
sha256sums=('d3954a6464d5f74ff7251dff2f217c482d04b0091d2bdd74b4c0bc441fc1eef7')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
}
