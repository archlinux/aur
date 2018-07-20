# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=php-transip-api
pkgver=5.8
pkgrel=1
pkgdesc="Official PHP library for access to TransIP's services through their API"
arch=('any')
url="https://www.transip.nl/transip/api/"
license=('unknown')
depends=('php')
source=("https://api.transip.nl/downloads/transapi_transip.nl_v${pkgver//./_}.tar.gz")
sha512sums=('1a50caa6b77e1bb18fc0cec6d38af5c9bc92f2c9b16ea37abbb3b814102f169d5c180447afd42e51ed8609de523f3c9e6da3903f7589e1d0fd304643d9d8aac1')

package() {
	install -Dm644 -t "${pkgdir}/usr/share/php/Transip" Transip/*
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/examples" examples/*
	install -Dm644 CHANGELOG "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
}
