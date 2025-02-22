# Maintainer: Husam Bilal <me@husam.dev>

pkgname="museeks-bin"
_pkgname="museeks"
pkgver="0.20.7"
pkgrel="1"
pkgdesc="A lightweight and cross-platform music player."
arch=("x86_64")
url="http://museeks.io"
license=("MIT")
depends=("gtk2" "cairo" "freetype2" "fontconfig" "nss" "alsa-lib" "ttf-font")
provides=("museeks")
conflicts=("museeks" "museeks-git")

sha256sums=("a7cf83de07d5494638f2fc09a385d6d2ba330c61d8d8040fd788e4826d595b2f")

source=("https://github.com/martpie/museeks/releases/download/0.20.7/Museeks-0.20.7-1.x86_64.rpm")

package() {
  cp -a $srcdir/opt $pkgdir/
  cp -a $srcdir/usr $pkgdir/
}
