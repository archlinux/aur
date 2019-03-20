# Maintainer: zarak <jean@bobine.com>

pkgname=term_size
pkgver=4
pkgrel=1
epoch=
pkgdesc="change current term's size"
arch=()
url="http://example.com"
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
md5sums=('54b786b80912f42d4c04e8f0c74612f6')
arch=('x86_64')

validpgpkeys=()

package() {
	cd "${srcdir}"
	install -Dm755 ${srcdir}/${pkgname}/term_size ${pkgdir}/usr/bin/term_size
}
