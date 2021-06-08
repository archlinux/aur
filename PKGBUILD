# Maintainer: Lena Fuhrimann

pkgname=pacmanfile
pkgver=0.0.7
pkgrel=2
pkgdesc='Manage your pacman packages declaratively'
arch=(x86_64 i686)
url="https://github.com/mastertinner/${pkgname}"
license=(Apache)
provides=("$pkgname")
source=("https://github.com/mastertinner/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c455350e02a956e067e995f1b35f31a42d39307e2376de74cfe69722215a73ae')

package() {
	install -Dm755 "$pkgname" -t "${pkgdir}/usr/bin"
}
