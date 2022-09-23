# Maintainer: Husam Bilal <me@husam.dev>

pkgname="museeks-bin"
_pkgname="museeks"
pkgver="0.13.1"
pkgrel="1"
pkgdesc="A lightweight and cross-platform music player."
arch=("x86_64" "i686")
url="http://museeks.io"
license=("MIT")
depends=("gtk2" "cairo" "freetype2" "fontconfig" "nss" "alsa-lib" "ttf-font")
provides=("museeks")
conflicts=("museeks" "museeks-git")

sha256sums=("43713cf4e39d7ede4ebee6d4ff9d26a28d26d3f6a2aa98a8337108321c9fea77")
[ "$CARCH" = "i686" ] && sha256sums=("e1a1d8e570c821f8b1532aa4b7f86428f98b7b135af0c2e9fbac9f41e85576fd")

source=("https://github.com/KeitIG/museeks/releases/download/${pkgver}/museeks-${CARCH}.rpm")

package() {
  cp -a $srcdir/opt $pkgdir/
  cp -a $srcdir/usr $pkgdir/
}
