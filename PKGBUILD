# Maintainer: Magnus Anderson <magnus@iastate.edu>
pkgname=px_ptop
pkgver=3.1.0
pkgrel=1
pkgdesc="ps and top for Human Beings"
arch=('any')
url="https://github.com/walles/px"
license=('MIT')
depends=()
md5sums=()
noextract=()

package() {
	mkdir -p "${pkgdir}/usr/bin"
	curl -Ls https://github.com/walles/px/raw/python/install.sh > install.sh
	sed -i 's/sudo//' install.sh
	sed -i "s|/usr/local/bin|$pkgdir/usr/bin|" install.sh
	bash install.sh
}
