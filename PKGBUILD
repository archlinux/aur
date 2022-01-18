# Maintainer: dreieck

_pkgname=autopanorama
pkgname="${_pkgname}-bin"
_pkgver=1.3.4
pkgver="${_pkgver}"
pkgrel=1
epoch=0
pkgdesc="Compose panoramas from multiple photos or videos, steps automatised."
arch=('x86_64')
url="https://github.com/Tytan/AutoPanorama"
license=('GPL3')
depends=('qt5-base')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${_pkgver}.deb::http://github.com/qchateau/AutoPanorama/releases/download/${_pkgver}/autopanorama-${_pkgver}.deb")
sha256sums=('94052801e8e1aa276a5da872fce6203cd6ddb826d15f19ac8a29a52bb828ce01')

package() {
    cd "${pkgdir}"
    bsdtar -xf "${srcdir}/data.tar.gz"
}
