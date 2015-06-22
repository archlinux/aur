# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=tnt
pkgver=126
pkgrel=1
pkgdesc="The Template Numerical Toolkit is an interface for scientific computing in C++."
arch=('i686' 'x86_64')
url="http://math.nist.gov/tnt"
license=('unknown')
source=(http://math.nist.gov/${pkgname}/${pkgname}${pkgver}.zip)
md5sums=('e87a913a44c0fe3694914b0f42c61fb1')

build() {
	cd ${srcdir}
	install -d ${pkgdir}/usr/include/${pkgname}
	install -m644 *.h ${pkgdir}/usr/include/${pkgname}	
}
