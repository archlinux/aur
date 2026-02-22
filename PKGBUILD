# Maintainer: Praful Adiga <lufimio1 at gmail dot com>

_pkgname=obs-livesplit-one
pkgname="${_pkgname}-bin"
pkgver=0.4.2
pkgrel=1
groups=('obs-plugins')
pkgdesc="A plugin for OBS Studio that allows adding LiveSplit One as a source."
arch=("x86_64")
url="https://github.com/LiveSplit/obs-livesplit-one"
license=("MIT AND Apache-2.0")
provides=("obs-livesplit-one")
conflicts=("obs-livesplit-one")
depends=("obs-studio")
_arch=x86_64-unknown-linux-gnu
_source="${_pkgname}-v${pkgver}-${_arch}.tar.gz"
source=("${url}/releases/download/v${pkgver}/${_source}")
sha256sums=('f50b46495635c1838efa8ade8d2d20aed16cc8f9e8003f4adbbae6b148db62ee')

package() {
    install -Dm755 -t "${pkgdir}/usr/lib/obs-plugins/" "${srcdir}/${_pkgname}/bin/64bit/libobs-livesplit-one.so"
}
