# Maintainer: hashworks <mail@hashworks.net>
pkgname=mustache
pkgver=3.2.1
pkgrel=2
pkgdesc="Mustache implementation for modern C++"
license=('Boost')
arch=('armv7h' 'i686' 'x86_64')
url='https://github.com/kainjow/Mustache'
source=("https://github.com/kainjow/Mustache/archive/v${pkgver}.tar.gz")
sha256sums=(0d17298a81c08f12ebc446cdee387268a395d34bb724050fe67d5ce8c4e98b7a)

package() {
	mkdir -p ${pkgdir}/usr/include/
	cp Mustache-${pkgver}/mustache.hpp ${pkgdir}/usr/include/
	chmod 644 ${pkgdir}/usr/include/mustache.hpp
}

