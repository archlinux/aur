# Maintainer: Lena Fuhrimann

pkgname=pacmanfile
pkgver=0.0.8
pkgrel=3
pkgdesc='Manage your pacman packages declaratively'
arch=(any)
url="https://github.com/cloudlena/${pkgname}"
license=(Apache)
provides=("$pkgname")
depends=(bash grep)
source=("https://github.com/cloudlena/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0a61d3fa2455f6d0b2d8647acd578cd27c822d35297e070b79bb8e8492c63642')

package() {
	install -Dm755 "${pkgname}-${pkgver}/$pkgname" -t "${pkgdir}/usr/bin"
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
