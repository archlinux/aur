# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=php-transip-api
pkgver=5.10
pkgrel=1
pkgdesc="Official PHP library for access to TransIP's services through their API"
arch=('any')
url="https://www.transip.nl/transip/api/"
license=('unknown')
depends=('php')
source=("https://api.transip.nl/downloads/transapi_transip.nl_v${pkgver//./_}.tar.gz")
sha512sums=('e0c36f86ebce9913c250643e9537b4648389ceb83e17d736ccb116c479137940f588a0b0db1ead06421cebaf06f6737ce241c9d000ad3ed595336e45c32a79de')

package() {
	install -Dm644 -t "${pkgdir}/usr/share/php/Transip" Transip/*
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/examples" examples/*
	install -Dm644 CHANGELOG "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
}
