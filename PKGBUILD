# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="keyfault"
pkgver="20.4.4.18"
pkgrel="1"
pkgdesc="Keyboard Auto-Default"
arch=("i686" "x86_64" "pentium4")
url="https://tari.in/www/software/keyfault"
license=("GPL3")
depends=("libxss")
makedepends=("breezy" "gcc" "libxss")
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

