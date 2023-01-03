# Contributor: Samuel Tardieu <sam@rfc1149.net>

pkgname=tnt
pkgver=126
pkgrel=1
epoch=1
pkgdesc="The Template Numerical Toolkit is an interface for scientific computing in C++."
arch=(any)
url="http://math.nist.gov/tnt"
license=('custom')
source=(http://math.nist.gov/${pkgname}/${pkgname}_${pkgver/./_}.zip license.txt)
md5sums=('e87a913a44c0fe3694914b0f42c61fb1'
         '4c3fa4245a5cf2cb3d0c98d82dd78d04')

package() {
	cd ${srcdir}
    pwd
    install -d ${pkgdir}/usr/share/licenses/${pkgname}/
    install -m 644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/
    install -d ${pkgdir}/usr/include/${pkgname}
    cd tnt
	install -m644 *.h ${pkgdir}/usr/include/${pkgname}	
}

