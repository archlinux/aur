# Maintainer: Raizo <raizo@riseup.net>

_pkgname='keira3'
pkgname="${_pkgname}"
pkgver=3.3.0
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
sha512sums=('744b72571388281b69750deacda8d8a8807205e1d593a79d605f7338503671ca1ca5f8f07d2570debecd3768dd9afe4f987701084fa54bfa346ed96ce76e3f59')
package() {
	ar xv Keira-${_pkgver}.LINUX.deb
	tar xf data.tar.xz -C "${pkgdir}"
	install -d "${pkgdir}/opt/${_pkgname}"
}

