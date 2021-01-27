# Maintainer: Lena Fuhrimann

pkgname=pacmanfile
pkgver=0.0.6
pkgrel=1
pkgdesc='Manage your pacman packages declaratively'
arch=(x86_64 i686)
url="https://github.com/mastertinner/${pkgname}"
license=(Apache)
provides=("$pkgname")
source=("https://raw.githubusercontent.com/mastertinner/${pkgname}/main/${pkgname}")
sha256sums=('3a5b096ad8e50ef2ac9143cc683a5daca5eb5a00d51bdca1ac9eda50f77df6fc')

package() {
	install -Dm755 "$pkgname" -t "${pkgdir}/usr/bin"
}
