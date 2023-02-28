# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=droppoint-bin
_pkgname=droppoint
pkgver=1.2.1
pkgrel=1
pkgdesc="Make drag-and-drop easier using DropPoint. Drag content without having to open side-by-side windows"
arch=('x86_64')
url="https://droppoint.netlify.app/"
_githuburl="https://github.com/GameGodS3/DropPoint"
license=('GPL3')
options=(!strip)
conflicts=()
depends=(nss at-spi2-core alsa-lib gtk3)
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha512sums=('fda0e4e0b1dac38223238fadc49fbcc58d6dd0016dc406f9b355854420b1b34d331efa77203aea79a9d59e3499c04d23025013446b3a0ae5340b77b384481267')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
}
