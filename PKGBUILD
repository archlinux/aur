# Maintainer: Osci <hello@oscillope.xyz>

_pkgbase=zoom-l8
pkgname="${_pkgbase}-dkms"
pkgver=0.0.1
pkgrel=1
pkgdesc="ALSA driver for Zoom LiveTrak L-8"
arch=('x86_64')
url="https://github.com/sreimers/zoom-l8"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=('git+https://github.com/sreimers/zoom-l8.git#commit=ae6ad73')
sha256sums=('SKIP')

package() {
    mkdir -p "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}
    cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
