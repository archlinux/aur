# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ambiant"
pkgver="22.9.8"
pkgrel="1"
pkgdesc="A fork of Ubuntu MATE's Ambiant theme"
arch=("any")
url="https://github.com/tari01/ambiant"
license=("GPL3")
depends=("gtk-engine-murrine")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("fbcdb5011950e831d211326ba4ba5014")

package()
{
    rm -fr ${pkgdir}/usr/share/icons/Ambiant
    mv ${srcdir}/${pkgname}-${pkgver}/usr ${pkgdir}/
}
