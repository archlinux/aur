# Maintainer: Husam Bilal <husam212 AT gmail DOT com>

pkgname="museeks-bin"
_pkgname="museeks"
pkgver="0.9.4"
pkgrel="1"
pkgdesc="A lightweight and cross-platform music player."
arch=("x86_64" "i686")
url="http://museeks.io"
license=("MIT")
depends=("gtk2" "cairo" "freetype2" "fontconfig" "gconf" "nss" "alsa-lib" "ttf-font")
provides=("museeks")
conflicts=("museeks" "museeks-git")

md5sums=("ef150449d0055ccc44b064456a78916c")
[ "$CARCH" = "i686" ] && md5sums=("70b9838670f66bcbee3e23f47d125d3b")

source=("https://github.com/KeitIG/museeks/releases/download/${pkgver}/museeks-${CARCH}.rpm")

package() {
  cp -a $srcdir/opt $pkgdir/
  cp -a $srcdir/usr $pkgdir/
}
