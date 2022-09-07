# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ambiant"
pkgver="22.9.7"
pkgrel="1"
pkgdesc="A fork of Ubuntu MATE's Ambiant theme"
arch=("any")
url="https://github.com/tari01/ambiant"
license=("GPL3")
depends=("gtk-engine-murrine" "humanity-icon-theme")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("368b50ee3884a0270962c5b6bf1c7545")

package()
{
    mv ${srcdir}/${pkgname}-${pkgver}/usr ${pkgdir}/
}
