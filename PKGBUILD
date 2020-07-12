pkgname=sequoia-redactor
_pkgname=SequoiaRedactor
pkgver=1.5
pkgrel=2
pkgdesc="Text editor"
DESTDIR="${startdir}/${_pkgname}"
arch=('x86_64')
url="https://github.com/AlexVIM1/sequoia"
license=('GPLv3')
depends=()
checkdepends=()
install=
changelog=
source=("https://raw.githubusercontent.com/AlexVIM1/sequoia/pkg/${_pkgname}-${pkgver}-${pkgrel}-${arch}-pkg.tar.gz")
md5sums=('9ce103c1cc69dbc38c118f6494821f5f')
package() {
    cd ${srcdir}/pkg
	
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	install -Dm755 SequoiaRedactor "${pkgdir}/usr/bin"
	install -Dm755 sequoia-icon.png "${pkgdir}/usr/share/pixmaps"
	install -Dm755 sequoia-redactor.desktop "${pkgdir}/usr/share/applications"
}
