# Maintainer: Maciej Dems <maciej.dems@p.lodz.pl>
pkgname=jama
pkgver=1.2.5
pkgrel=1
pkgdesc='C++ Linear Algebra Library based on TNT'
arch=(any)
url="http://math.nist.gov/tnt"
license=('custom')
source=('https://math.nist.gov/tnt/jama125.zip')
md5sums=('7a5acf6031cf35a6bb15a0fe1f70ed34')
depends=('tnt')

package() {
    cd ${srcdir}
    install -d ${pkgdir}/usr/include/${pkgname}
    install -m644 *.h ${pkgdir}/usr/include/${pkgname}	
}
