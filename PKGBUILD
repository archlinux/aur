# Maintainer: Husam Bilal <me@husam.dev>

pkgname="museeks-bin"
_pkgname="museeks"
pkgver="0.20.9"
pkgrel="1"
pkgdesc="A lightweight and cross-platform music player."
arch=("x86_64")
url="http://museeks.io"
license=("MIT")
depends=("gtk2" "cairo" "freetype2" "fontconfig" "nss" "alsa-lib" "ttf-font")
provides=("museeks")
conflicts=("museeks" "museeks-git")

sha256sums=("269850c1f8601b25d245495491214be0083245f764cd2e13729bea56353dbb64")

source=("https://github.com/martpie/museeks/releases/download/0.20.9/Museeks-0.20.9-1.x86_64.rpm")

package() {
  cp -a $srcdir/opt $pkgdir/
  cp -a $srcdir/usr $pkgdir/
}
