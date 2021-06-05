# Maintainer: Lena Fuhrimann

pkgname=pacmanfile
pkgver=0.0.7
pkgrel=1
pkgdesc='Manage your pacman packages declaratively'
arch=(x86_64 i686)
url="https://github.com/mastertinner/${pkgname}"
license=(Apache)
provides=("$pkgname")
source=("https://raw.githubusercontent.com/mastertinner/${pkgname}/v${pkgver}/${pkgname}")
sha256sums=('6179e2bc7312323edd60244cf4c1fa87b7850a9f0500bca0c956064b1d97590f')

package() {
	install -Dm755 "$pkgname" -t "${pkgdir}/usr/bin"
}
