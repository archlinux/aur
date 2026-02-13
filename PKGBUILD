# Maintainer: Husam Bilal <me@husam.dev>

pkgname="museeks-bin"
_pkgname="museeks"
pkgver="0.23.2"
pkgrel="1"
pkgdesc="A lightweight and cross-platform music player."
arch=("x86_64")
url="http://museeks.io"
license=("MIT")
depends=("gtk2" "cairo" "freetype2" "fontconfig" "nss" "alsa-lib" "ttf-font" "webkit2gtk-4.1")
provides=("museeks")
conflicts=("museeks" "museeks-git")

sha256sums=("c149bd80aa69ffda0137a48add61c2076e89232c54539f497d2f3eb32951e01a")

source=("https://github.com/martpie/museeks/releases/download/0.23.2/Museeks-0.23.2-1.x86_64.rpm")

package() {
  cp -a $srcdir/usr $pkgdir/
}
