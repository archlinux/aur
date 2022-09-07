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
sha256sums=("a3458497b6c640414b52c8f1cbcbb9809827f63ffe07930e4c840f95f4c254d8")

package()
{
    mv ${srcdir}/${pkgname}-${pkgver}/usr ${pkgdir}/
}
