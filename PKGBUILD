# Maintainer: Husam Bilal <me@husam.dev>

pkgname="museeks-bin"
_pkgname="museeks"
pkgver="0.20.4"
pkgrel="1"
pkgdesc="A lightweight and cross-platform music player."
arch=("x86_64")
url="http://museeks.io"
license=("MIT")
depends=("gtk2" "cairo" "freetype2" "fontconfig" "nss" "alsa-lib" "ttf-font")
provides=("museeks")
conflicts=("museeks" "museeks-git")

sha256sums=("df18399c74e7383e7c881ea195dd88fa7f92eb15e9851229e4d11767e1754ec8")

source=("https://github.com/KeitIG/museeks/releases/download/${pkgver}/museeks-${CARCH}.rpm")

package() {
  cp -a $srcdir/opt $pkgdir/
  cp -a $srcdir/usr $pkgdir/
}
