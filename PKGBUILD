# Maintainer: Raizo <raizo@riseup.net>

_pkgname='keira3'
pkgname="${_pkgname}"
pkgver=3.2.0
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
sha512sums=('1fcfe5363f8dc1792c8e3215aff2cabaed7b8d16d1243b3f0222d6242f96966aa7d9bb6f7da90d20358cbf8e7d099e0867ab51f854ada63f7762283920ff548e')
package() {
	ar xv Keira-${_pkgver}.LINUX.deb
	tar xf data.tar.xz -C "${pkgdir}"
	install -d "${pkgdir}/opt/${_pkgname}"
}

