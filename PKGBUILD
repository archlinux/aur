# Maintainer: hashworks <mail@hashworks.net>
pkgname=mustache
pkgver=4.0b2
pkgrel=1
pkgdesc="Mustache implementation for modern C++"
license=('Boost')
arch=('any')
url='https://github.com/kainjow/Mustache'
source=("https://github.com/kainjow/Mustache/archive/v${pkgver}.tar.gz")
sha256sums=(ba7f02a4a3c4559821a13d7566d224c66806b370c82a5a5cf80be5b339fd32d4)

package() {
	mkdir -p ${pkgdir}/usr/include/
	cp Mustache-${pkgver}/mustache.hpp ${pkgdir}/usr/include/
}

