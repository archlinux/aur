# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deltachat-desktop-bin
_pkgname=deltachat-desktop
pkgver=1.34.4
pkgrel=1
pkgdesc="Email-based instant messaging for Desktop."
arch=('x86_64')
url="https://github.com/deltachat/deltachat-desktop"
license=('GPL3')
providers=(deltachat)
options=()
depends=('nss' 'python>=3.0' 'alsa-lib' 'at-spi2-core' 'gtk3')
source=("${_pkgname}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.pacman")
sha256sums=('99a77caf7f4e4125463204945ab7a60c277047945ec2bbe78875c6749366ef43')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}