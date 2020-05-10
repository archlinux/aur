# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="libodiosacd"
pkgver="20.5.9"
pkgrel="1"
pkgdesc="SACD decoder (shared library)"
arch=("i686" "x86_64")
url="https://tari.in/www/software/libodiosacd"
license=("GPL3")
makedepends=("bzr" "gcc" "glibc")
depends=("glibc")
source=("bzr+lp:/${pkgname}/trunk")
md5sums=("SKIP")
options=("!emptydirs")

build()
{
    cd trunk
    make
}

package()
{
    cd trunk
    make DESTDIR="$pkgdir/" install
}
