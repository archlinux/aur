# Maintainer: zarak <cyril@cri.epita.fr>

pkgname=term_size
pkgver=6
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
md5sums=('8f40d78b2a1d44dc13e9cb31dcefcbb0')
arch=('x86_64')

validpgpkeys=()

package() {
	cd "${srcdir}"
	install -Dm755 ${srcdir}/${pkgname}/term_size ${pkgdir}/usr/bin/term_size
}
