# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ambiant"
pkgver="23.9.1"
pkgrel="1"
pkgdesc="A fork of Ubuntu MATE's Ambiant theme"
arch=("any")
url="https://tari.in/www/software/ambiant"
license=("GPL2" "GPL3")
install="${pkgname}.install"
depends=("gtk-engine-murrine")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("7ce043409aa3df8b8a1aee051c2f2d2a")

package()
{
    cp -dr ${srcdir}/${pkgname}-${pkgver}/usr ${pkgdir}/
}
