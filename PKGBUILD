# Maintainer: Praful Adiga <lufimio1 at gmail dot com>

_pkgname=obs-livesplit-one
pkgname="${_pkgname}-bin"
pkgver=0.5.3
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
sha256sums=('7b5c6ec1127a1830a5512d59ecf31dcd1b90242d17710360bbce439ee720690d')

package() {
  install -Dm755 -t "${pkgdir}/usr/lib/obs-plugins/" "${srcdir}/${_pkgname}/bin/64bit/libobs-livesplit-one.so"
}
