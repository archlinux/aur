# Maintainer: Husam Bilal <husam212 AT gmail DOT com>

pkgname="museeks-bin"
_pkgname="museeks"
pkgver="0.10.0"
pkgrel="1"
pkgdesc="A lightweight and cross-platform music player."
arch=("x86_64" "i686")
url="http://museeks.io"
license=("MIT")
depends=("gtk2" "cairo" "freetype2" "fontconfig" "gconf" "nss" "alsa-lib" "ttf-font")
provides=("museeks")
conflicts=("museeks" "museeks-git")

md5sums=("4c7eec87e5b4c9b0c1516f1e4d7529c3")
[ "$CARCH" = "i686" ] && md5sums=("c856837aad5f4c5212e1dae54767dacf")

source=("https://github.com/KeitIG/museeks/releases/download/${pkgver}/museeks-${CARCH}.rpm")

package() {
  cp -a $srcdir/opt $pkgdir/
  cp -a $srcdir/usr $pkgdir/
}
