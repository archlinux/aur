pkgname=kyocera-ecosys-m2035dn
pkgver=1.0
pkgrel=1
pkgdesc="PPD file for Kyocera ECOSYS M2035dn"
arch=("any")
url="http://kyocera.com"
license=('other')
depends=('cups')

source=('Kyocera_ECOSYS_M2035dn.ppd')

md5sums=('03353825f29e6ff82b96528faa589175')

package () {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/share/ppd
    install -D -m644 Kyocera_ECOSYS_M2035dn.ppd ${pkgdir}/usr/share/ppd/Kyocera_ECOSYS_M2035dn.ppd
}
