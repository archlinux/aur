# Maintainer: zarak <cyril@cri.epita.fr>

pkgname=term_size
pkgver=5
pkgrel=1
epoch=
pkgdesc="Change terminal font size"
arch=()
url="http://github.com/epita/term_size"
license=('GPL3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('c8d980c314a5662c51547cb1736ddb97')
arch=('x86_64')

validpgpkeys=()

package() {
	cd "${srcdir}"
	install -Dm755 ${srcdir}/${pkgname}/term_size ${pkgdir}/usr/bin/term_size
}
