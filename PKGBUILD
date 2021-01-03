# Maintainer: Ouizzy <bilucristian25@gmail.com>

_pkgname='keira3'
pkgname="${_pkgname}"
pkgver=3.0.2
_pkgver="${pkgver}"
gitname="v${_pkgver}"
pkgrel=1
pkgdesc="Cross-platform editor tailored for AzerothCore"
arch=('x86_64')
url="https://www.azerothcore.org/Keira3/"
license=('AGPL3')
provides=(${_pkgname})
source=(
    https://github.com/azerothcore/Keira3/releases/download/${gitname}/Keira-${_pkgver}.LINUX.deb.zip
)
sha512sums=('SKIP')
package() {
	ar xv Keira-${_pkgver}.LINUX.deb
	tar xf data.tar.xz -C "${pkgdir}"
	install -d "${pkgdir}/opt/${_pkgname}"
}

