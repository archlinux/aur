# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ambiant"
pkgver="22.10.31"
pkgrel="1"
pkgdesc="A fork of Ubuntu MATE's Ambiant theme"
arch=("any")
url="https://tari.in/www/software/ambiant"
license=("GPL2" "GPL3")
install="${pkgname}.install"
depends=("gtk-engine-murrine")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("0a95f0933e83c904cd483d6e24fb8987")

package()
{
    mv ${srcdir}/${pkgname}-${pkgver}/usr ${pkgdir}/
}
