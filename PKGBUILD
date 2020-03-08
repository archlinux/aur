pkgname=sequoia-redactor
_pkgname=SequoiaRedactor
pkgver=1.3
pkgrel=1
pkgdesc="Text editor"
DESTDIR="${startdir}/${_pkgname}"
arch=('x86_64')
url="https://github.com/AlexVIM1/sequoia"
license=('GPLv3')
checkdepends=()
install=
changelog=
source=("https://raw.githubusercontent.com/AlexVIM1/sequoia/master/${_pkgname}-${pkgver}-${arch}.tar.gz")
md5sums=('3a0f817aeaa8e1fe2df4a4de57714624')
build() {
    cd ${srcdir}/build
    qmake
    make
}
package() {
    cd ${srcdir}/build
	make INSTALL_ROOT="$pkgdir" install
}
