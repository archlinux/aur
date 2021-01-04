# Maintainer: dreieck

_pkgname=autopanorama
pkgname="${_pkgname}-bin"
_pkgver=1.3.2
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
sha256sums=('ca8c6b22f03e4da5a67e054259e8dafc4b23bc78b9bca01816521a4adb0e894a')

package() {
    cd "${pkgdir}"
    bsdtar -xf "${srcdir}/data.tar.gz"
}
