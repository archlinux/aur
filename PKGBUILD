# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=php-transip-api
pkgver=5.18.0
pkgrel=1
pkgdesc="Official PHP library for access to TransIP's services through their API"
arch=('any')
url="https://www.transip.nl/transip/api/"
license=('Apache')
depends=('php')
source=("https://github.com/transip/transip-api-php/archive/v${pkgver}.tar.gz")
sha512sums=('b9694279007c0d866e20acabef7b0063960e071ee4bab721e602b8246fc5b76162ac9081a1451204f416648199dc359c81538975c1b16a984b63a1c25f7f54b2')

package() {
	cd "transip-api-php-${pkgver}"

	install -Dm644 -t "${pkgdir}/usr/share/php/Transip" Transip/*
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/examples" examples/*
	install -Dm644 CHANGELOG "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
