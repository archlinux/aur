# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="libodiosacd"
pkgver="20.5.12"
pkgrel="1"
pkgdesc="SACD decoder (shared library)"
arch=("i686" "x86_64" "pentium4")
url="https://tari.in/www/software/libodiosacd"
license=("GPL3")
makedepends=("gcc" "glibc")
depends=("glibc")
source=("https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("f8d6ab055732a1574ed0650ab5afcd7d")
options=("!emptydirs")

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}
