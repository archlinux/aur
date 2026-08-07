# Maintainer: Praful Adiga <lufimio1 at gmail dot com>

_pkgname=obs-livesplit-one
pkgname="${_pkgname}-bin"
pkgver=0.5.1
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
sha256sums=('73e5fdafee5304328a1e2b12f7454db9c29c647fb5e71db0466a3b62445b5e42')

package() {
    install -Dm755 -t "${pkgdir}/usr/lib/obs-plugins/" "${srcdir}/${_pkgname}/bin/64bit/libobs-livesplit-one.so"
}
