# Maintainer: Lena Fuhrimann

pkgname=pacmanfile
pkgver=0.0.6
pkgrel=2
pkgdesc='Manage your pacman packages declaratively'
arch=(x86_64 i686)
url="https://github.com/mastertinner/${pkgname}"
license=(Apache)
provides=("$pkgname")
source=("https://raw.githubusercontent.com/mastertinner/${pkgname}/fd132d8bbf7711c3f1781382a1c2fb81e1caa8e7/${pkgname}")
sha256sums=('3a5b096ad8e50ef2ac9143cc683a5daca5eb5a00d51bdca1ac9eda50f77df6fc')

package() {
	install -Dm755 "$pkgname" -t "${pkgdir}/usr/bin"
}
