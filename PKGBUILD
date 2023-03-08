# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=diffuse-player-bin
_pkgname=diffuse
pkgver=3.3.0
pkgrel=1
pkgdesc="A music player that connects to your cloud/distributed storage."
arch=('x86_64')
url="https://diffuse.sh/"
_githuburl="https://github.com/icidasset/diffuse"
license=(PPL2)
depends=(webkit2gtk)
conflicts=(diffuse-player-appimage)
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${_pkgname}-linux-amd64.deb")
sha256sums=('47703b10325b6e4d65960d573b1a6a8b04d992a523ce2b2605aae0ec0522bcd0')
package() {
    bsdtar -xf data.tar.gz
    cp -r "${srcdir}/usr" "${pkgdir}"
}