# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=ia
pkgname=${_pkgname}-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="A Python and Command-Line Interface to Archive.org"
arch=('x86_64')
url="https://archive.org/download/ia-pex/"
license=('GPL')
provides=(${pkgname})
conflicts=(${pkgname})
source=("https://archive.org/download/ia-pex/ia")
sha512sums=('2c599bc83fa102f9de47e350cc3636d79ca620da154d7e8a33b22b97288231c8ad1fbb394eba3bf7fb28200aa055a28828715b260c33ecfb69df945af0fd58e9')

package() {
	cd ${startdir}
	install -Dm755 "${_pkgname}" "${pkgdir}"/usr/bin/${_pkgname}
}
