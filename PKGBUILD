# Maintainer: Husam Bilal <husam212 AT gmail DOT com>

pkgname="museeks-bin"
_pkgname="museeks"
pkgver="0.10.1"
pkgrel="1"
pkgdesc="A lightweight and cross-platform music player."
arch=("x86_64" "i686")
url="http://museeks.io"
license=("MIT")
depends=("gtk2" "cairo" "freetype2" "fontconfig" "gconf" "nss" "alsa-lib" "ttf-font")
provides=("museeks")
conflicts=("museeks" "museeks-git")

md5sums=("47a7815d180fbdd9025c349818f6677d")
[ "$CARCH" = "i686" ] && md5sums=("a4568902e47983afae3cc51d61bf18ad")

source=("https://github.com/KeitIG/museeks/releases/download/${pkgver}/museeks-${CARCH}.rpm")

package() {
  cp -a $srcdir/opt $pkgdir/
  cp -a $srcdir/usr $pkgdir/
}
