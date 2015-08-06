# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Andreas Wagner <andreas.wagner@lowfatcomputing.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>

pkgname=icmake
pkgver=7.22.01
pkgrel=1
pkgdesc='Intelligent C-like MAKE-r.'
arch=('i686' 'x86_64')
url='http://icmake.sourceforge.net/'
license=('GPL3')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('b522e7937e9d4f0bec738dfce371673e3c4a8bc9f4d209a51631e5ed59ba66c7')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	./icm_bootstrap /
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	./icm_install all ${pkgdir}
}

