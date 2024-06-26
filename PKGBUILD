# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ambiant"
pkgver="24.5.1"
pkgrel="1"
pkgdesc="A green theme inspired by Ubuntu's Ambiance and Humanity"
arch=("any")
url="https://tari.in/www/software/ambiant"
license=("GPL-2.0-or-later" "GPL-3.0-or-later")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("f82463e0f8320b8474c2c9d5a847e324")

package()
{
    cp -dr ${srcdir}/${pkgname}-${pkgver}/usr ${pkgdir}/
}
