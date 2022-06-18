# Maintainer: Husam Bilal <me@husam.dev>

pkgname="museeks-bin"
_pkgname="museeks"
pkgver="0.13.0"
pkgrel="1"
pkgdesc="A lightweight and cross-platform music player."
arch=("x86_64" "i686")
url="http://museeks.io"
license=("MIT")
depends=("gtk2" "cairo" "freetype2" "fontconfig" "nss" "alsa-lib" "ttf-font")
provides=("museeks")
conflicts=("museeks" "museeks-git")

md5sums=("34ba689e09c7b17bf865d32bf8e9cf3a")
[ "$CARCH" = "i686" ] && md5sums=("f84f0458e86226aaa89ced8b9c0df762")

source=("https://github.com/KeitIG/museeks/releases/download/${pkgver}/museeks-${CARCH}.rpm")

package() {
  cp -a $srcdir/opt $pkgdir/
  cp -a $srcdir/usr $pkgdir/
}
