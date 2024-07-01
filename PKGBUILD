# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ambiant"
pkgver="24.7.1"
pkgrel="1"
pkgdesc="A green theme inspired by Ubuntu's Ambiance and Humanity"
arch=("any")
url="https://tari.in/www/software/ambiant"
license=("GPL-2.0-or-later" "GPL-3.0-or-later")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("e4db02ccd59ef15f94e3eb30c46b2295")

package()
{
    cp -dr ${srcdir}/${pkgname}-${pkgver}/usr ${pkgdir}/
}
