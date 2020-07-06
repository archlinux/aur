# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="libodiosacd"
pkgver="20.5.11.11"
pkgrel="1"
pkgdesc="SACD decoder (shared library)"
arch=("i686" "x86_64" "pentium4")
url="https://tari.in/www/software/libodiosacd"
license=("GPL3")
makedepends=("breezy" "gcc" "glibc")
depends=("glibc")
source=("bzr+lp:${pkgname}")
md5sums=("SKIP")
options=("!emptydirs")

build()
{
    cd ${srcdir}/${pkgname}
    make
}

package()
{
    cd ${srcdir}/${pkgname}
    make DESTDIR="$pkgdir/" install
}
