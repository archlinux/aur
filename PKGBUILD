# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="odio-edit"
pkgver="20.5.11.18"
pkgrel="3"
pkgdesc="A lightweight audio wave editor"
arch=("i686" "x86_64")
url="https://tari.in/www/software/odio-edit"
license=("GPL3")
depends=("gst-plugins-base" "gtk3" "dconf" "gst-libav" "libodiosacd")
makedepends=("bzr" "gcc" "gst-plugins-base-libs" "gtk3" "libodiosacd")
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
