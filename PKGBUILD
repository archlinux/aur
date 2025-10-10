# Maintainer: Husam Bilal <me@husam.dev>

pkgname="museeks-bin"
_pkgname="museeks"
pkgver="0.23.1"
pkgrel="1"
pkgdesc="A lightweight and cross-platform music player."
arch=("x86_64")
url="http://museeks.io"
license=("MIT")
depends=("gtk2" "cairo" "freetype2" "fontconfig" "nss" "alsa-lib" "ttf-font" "webkit2gtk-4.1")
provides=("museeks")
conflicts=("museeks" "museeks-git")

sha256sums=("ef7a246b4dc6165a50ce2e76d55467d1e0fdbef23218cc2ae9826c27f106d460")

source=("https://github.com/martpie/museeks/releases/download/0.23.1/Museeks-0.23.1-1.x86_64.rpm")

package() {
  cp -a $srcdir/usr $pkgdir/
}
