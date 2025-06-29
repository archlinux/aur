# Maintainer: Husam Bilal <me@husam.dev>

pkgname="museeks-bin"
_pkgname="museeks"
pkgver="0.22.0"
pkgrel="1"
pkgdesc="A lightweight and cross-platform music player."
arch=("x86_64")
url="http://museeks.io"
license=("MIT")
depends=("gtk2" "cairo" "freetype2" "fontconfig" "nss" "alsa-lib" "ttf-font" "webkit2gtk-4.1")
provides=("museeks")
conflicts=("museeks" "museeks-git")

sha256sums=("56be3c69499fc2447fe843c905d903f8e3703264f9a88ca419d2ad98e65be473")

source=("https://github.com/martpie/museeks/releases/download/0.22.0/Museeks-0.22.0-1.x86_64.rpm")

package() {
  cp -a $srcdir/usr $pkgdir/
}
