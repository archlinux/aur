# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ambiant"
pkgver="24.8.1"
pkgrel="1"
pkgdesc="A green theme inspired by Ubuntu's Ambiance and Humanity"
arch=("any")
url="https://tari.in/www/software/ambiant"
license=("GPL-2.0-or-later" "GPL-3.0-or-later")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("68be35c02662cb28f1e5e4cf3364a1ff")

package()
{
    cp -dr ${srcdir}/${pkgname}-${pkgver}/usr ${pkgdir}/
}
