# Maintainer Doug Bromley <doug@strawdogs.co>
pkgname=kyocera-ecosys-p5021cdw
pkgver=1.0
pkgrel=1
pkgdesc="PPD file for Kyocera ECOSYS P5021cdw"
arch=("any")
url="http://kyocera.com"
license=('other')
depends=('cups')

source=('Kyocera ECOSYS P5021cdw.PPD')

md5sums=('66c37971d98f4de617c5bf7f20877d33')

package () {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/share/ppd
    install -D -m644 "Kyocera ECOSYS P5021cdw.PPD" "${pkgdir}/usr/share/ppd/Kyocera ECOSYS P5021cdw.PPD"
}
