# Maintainer: hashworks <mail@hashworks.net>
pkgname=mustache
pkgver=4.1
pkgrel=2
pkgdesc="Mustache implementation for modern C++"
license=('Boost')
arch=('any')
url='https://github.com/kainjow/Mustache'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=(acd66359feb4318b421f9574cfc5a511133a77d916d0b13c7caa3783c0bfe167)

package() {
	install -Dm644 "Mustache-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 "Mustache-${pkgver}/mustache.hpp" "${pkgdir}/usr/include/mustache.hpp"
}

