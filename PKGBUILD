# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="odio-sacd"
pkgver="21.1.9"
pkgrel="1"
pkgdesc="SACD decoder"
arch=("i686" "x86_64" "pentium4")
url="https://tari.in/www/software/odio-sacd"
license=("GPL3")
depends=("libodiosacd")
makedepends=("libodiosacd")
source=("https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("ec7d54425ad4aba58fa0abb932dccc35")
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
