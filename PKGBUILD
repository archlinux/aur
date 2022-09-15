# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ambiant"
pkgver="22.9.15"
pkgrel="1"
pkgdesc="A fork of Ubuntu MATE's Ambiant theme"
arch=("any")
url="https://github.com/tari01/ambiant"
license=("GPL2" "GPL3")
install="${pkgname}.install"
depends=("gtk-engine-murrine")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("dc3f7ac88af1266665ab024e540a30ff")

package()
{
    mv ${srcdir}/${pkgname}-${pkgver}/usr ${pkgdir}/
}
