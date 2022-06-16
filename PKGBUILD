# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=ia
pkgname=${_pkgname}-bin
pkgver=3.0.2
pkgrel=1
pkgdesc="A Python and Command-Line Interface to Archive.org"
arch=('x86_64')
url="https://archive.org/download/ia-pex/"
license=('GPL')
provides=(${pkgname})
conflicts=(${pkgname})
source=("https://archive.org/download/ia-pex/ia")
sha512sums=('2313ef04ef7e5aa80080997b7ce3812296f35f427ab0da18c92319dc6b862b3d74861d5cdcef974a64a436635c64f7a50cbfcd9bfac805a41923af2218ad1429')

package() {
	cd ${startdir}
	install -Dm755 "${_pkgname}" "${pkgdir}"/usr/bin/${_pkgname}
}
