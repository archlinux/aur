# Maintainer: hashworks <mail@hashworks.net>
pkgname=mustache
pkgver=4.1
pkgrel=1
pkgdesc="Mustache implementation for modern C++"
license=('Boost')
arch=('armv7h' 'i686' 'x86_64')
url='https://github.com/kainjow/Mustache'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=(acd66359feb4318b421f9574cfc5a511133a77d916d0b13c7caa3783c0bfe167)

package() {
	install -D -m644 "Mustache-${pkgver}/mustache.hpp" "${pkgdir}/usr/include/mustache.hpp"
}

