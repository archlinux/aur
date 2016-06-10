pkgname=kyocera-ecosys-p6035cdn
pkgver=1.0
pkgrel=1
pkgdesc="PPD file for Kyocera ECOSYS P6035cdn"
arch=("any")
url="http://kyocera.com"
license=('other')
depends=('cups')

source=('Kyocera ECOSYS P6035cdn.PPD')

md5sums=('8c5578248a2f6dfa39660934f9f2e6cc')

package () {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/share/ppd
    install -D -m644 "Kyocera ECOSYS P6035cdn.PPD" "${pkgdir}/usr/share/ppd/Kyocera ECOSYS P6035cdn.PPD"
}
