# Maintainer: Husam Bilal <me@husam.dev>

pkgname="museeks-bin"
_pkgname="museeks"
pkgver="0.11.4"
pkgrel="1"
pkgdesc="A lightweight and cross-platform music player."
arch=("x86_64" "i686")
url="http://museeks.io"
license=("MIT")
depends=("gtk2" "cairo" "freetype2" "fontconfig" "gconf" "nss" "alsa-lib" "ttf-font")
provides=("museeks")
conflicts=("museeks" "museeks-git")

md5sums=("e5f2e0a78d692a7d467d743818a1152e")
[ "$CARCH" = "i686" ] && md5sums=("82a18bde45aa3a89df1e75e3e409bb6c")

source=("https://github.com/KeitIG/museeks/releases/download/${pkgver}/museeks-${CARCH}.rpm")

package() {
  cp -a $srcdir/opt $pkgdir/
  cp -a $srcdir/usr $pkgdir/
}
