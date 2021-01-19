# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="libodiosacd"
pkgver="21.1.19"
pkgrel="1"
pkgdesc="SACD decoder (shared library)"
arch=("i686" "x86_64" "pentium4")
url="https://tari.in/www/software/libodiosacd"
license=("GPL3")
makedepends=("glibc")
depends=("glibc")
source=("https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("29d530a7b34a9225fffe6763ca43608f")
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
