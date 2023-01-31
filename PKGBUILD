# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="keyfault"
pkgver="23.1.31"
pkgrel="1"
pkgdesc="Keyboard Auto-Default"
arch=("i686" "x86_64" "pentium4")
url="https://tari.in/www/software/keyfault"
license=("GPL3")
depends=("libxss")
makedepends=("libxss")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("9a469bd07f0666754d11b907e400d835")
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

