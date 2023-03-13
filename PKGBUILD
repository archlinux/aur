# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zui-bin
_pkgname=zui
pkgver=1.0.0
pkgrel=1
pkgdesc="A powerful desktop application for exploring and working with data. The official front-end to the Zed lake."
arch=('x86_64')
url="https://www.brimdata.io/"
_githuburl="https://github.com/brimdata/zui"
license=('BSD-3-Clause' "PPL1")
options=()
providers=(brimdata)
conflicts=(zui)
depends=(at-spi2-core python gtk3 alsa-lib nss)
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha512sums=('23d672f9b3080fc6e45b08c7cfff3cf7b06188edc4287aff6a14885b58f353a03e62fb378cff9fcb1a88e289ef87f899b5ed6c0e68264b9b7748346db1f519e6')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
}
