# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-qiskitblocks
_pkgname=qiskitblocks
_pkgauthor=JavaFXpert
pkgver=2020.09.25
_cdbrel=5212
pkgrel=1
pkgdesc="Teaching Quantum Computing using Qiskit in a block world"
license=("Apache-2.0")
sha256sums=('fdb94d062f1a227c77596079b5d078495b8e6f26e89c45b56be3ee7b8d1daa0f')

arch=("any")
url="https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/"
depends=("minetest-common")
makedepends=("unzip")
source=("${_pkgname}-${pkgver}.zip::https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/releases/${_cdbrel}/download/")
options=(!strip)
noextract=("${_pkgname}-${pkgver}.zip")

package() {
	# the release zip has the files in the root of the archive
	install -d "${pkgdir}/usr/share/minetest/games/${_pkgname}"
	unzip "${_pkgname}-${pkgver}.zip" -d "${pkgdir}/usr/share/minetest/games/${_pkgname}/"
}
