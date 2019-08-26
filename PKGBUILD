# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=php-transip-api
pkgver=5.16
pkgrel=1
pkgdesc="Official PHP library for access to TransIP's services through their API"
arch=('any')
url="https://www.transip.nl/transip/api/"
license=('Apache')
depends=('php')
source=("https://github.com/transip/transip-api-php/archive/v${pkgver}.tar.gz")
sha512sums=('e6dd0185d5b6be370a86e6ab7e2eee679f0737f868c7470332ae3c32edb76ac1f0e55502b1058074300a49e00a18c8383778ac37a4b6c9248af927966431d660')

package() {
	cd "transip-api-php-${pkgver}"

	install -Dm644 -t "${pkgdir}/usr/share/php/Transip" Transip/*
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/examples" examples/*
	install -Dm644 CHANGELOG "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
