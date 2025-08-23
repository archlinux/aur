# Maintainer: Husam Bilal <me@husam.dev>

pkgname="museeks-bin"
_pkgname="museeks"
pkgver="0.23.0"
pkgrel="1"
pkgdesc="A lightweight and cross-platform music player."
arch=("x86_64")
url="http://museeks.io"
license=("MIT")
depends=("gtk2" "cairo" "freetype2" "fontconfig" "nss" "alsa-lib" "ttf-font" "webkit2gtk-4.1")
provides=("museeks")
conflicts=("museeks" "museeks-git")

sha256sums=("85425bc678f63481135c9c0530dd9aabe9e35b8264cbde58d6cde0fa47cd0139")

source=("https://github.com/martpie/museeks/releases/download/0.23.0/Museeks-0.23.0-1.x86_64.rpm")

package() {
  cp -a $srcdir/usr $pkgdir/
}
