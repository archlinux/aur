# Maintainer: zarak <jean@bobine.com>

pkgname=term_size
pkgver=1
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
md5sums=('c31846ee8086af22278492703cc459f3')
arch=('x86_64')

validpgpkeys=()

package() {
	cd "${srcdir}"
	install -Dm755 ${srcdir}/${pkgname}/term_size ${pkgdir}/usr/bin/term_size
}
