# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ambiant"
pkgver="23.7.1"
pkgrel="1"
pkgdesc="A fork of Ubuntu MATE's Ambiant theme"
arch=("any")
url="https://tari.in/www/software/ambiant"
license=("GPL2" "GPL3")
install="${pkgname}.install"
depends=("gtk-engine-murrine")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("4380d01001b050734b485d9da9e7c53f")

package()
{
    cp -dr ${srcdir}/${pkgname}-${pkgver}/usr ${pkgdir}/
}
