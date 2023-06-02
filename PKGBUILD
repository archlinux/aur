pkgname="ourgalaxy-bin"
_pkgname="ourgalaxy"
pkgver=2.1.0
pkgrel=1
pkgdesc="app that helps you understand the structural components of the Galaxy"
arch=("x86_64")
url='https://www.otherwise.com/'
license=('custom')
source=("https://otherwise.com/OurGalaxy_Linux.zip" "ourgalaxy.desktop")
sha256sums=('2950167d6bad4b1c841326b8d57f60e195dfba1e2bea31b7e176183daac1d9e1' 'd4640e10132c6615870bd5040dd47ed15e9ab5eeba42a2014e6089f55b78494b')

package() {
	install -d "${pkgdir}/opt"
	install -d "${pkgdir}/usr/share/applications"

	cp -r "${srcdir}/OurGalaxy_Linux/" "${pkgdir}/opt/${_pkgname}"
	chmod +x "${pkgdir}/opt/${_pkgname}/OurGalaxy_Linux.x86_64"

	install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

