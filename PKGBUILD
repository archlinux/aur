# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ambiant"
pkgver="23.4.1"
pkgrel="1"
pkgdesc="A fork of Ubuntu MATE's Ambiant theme"
arch=("any")
url="https://tari.in/www/software/ambiant"
license=("GPL2" "GPL3")
install="${pkgname}.install"
depends=("gtk-engine-murrine")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("9ba176b5f6a994f823ecd9f059fbc84e")

package()
{
    mv ${srcdir}/${pkgname}-${pkgver}/usr ${pkgdir}/
}
