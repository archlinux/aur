# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=php-transip-api
pkgver=5.6
pkgrel=1
pkgdesc="Official PHP library for access to TransIP's services through their API"
arch=('any')
url="https://www.transip.nl/transip/api/"
license=('unknown')
depends=('php')
source=("https://api.transip.nl/downloads/transapi_transip.nl_v${pkgver//./_}.tar.gz")
sha512sums=('5f965c9263f4d6c1b908848fceb7b7819c161690f444c9fa4d60a8d57e023bc141ae54a64f52d75c6ec4aeeffe9dd4414e39738d5567f0e856fe83180672ac40')

package() {
	install -Dm644 -t "${pkgdir}/usr/share/php/Transip" Transip/*
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/examples" examples/*
	install -Dm644 CHANGELOG "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
}
