# Maintainer: Husam Bilal <me@husam.dev>

pkgname="museeks-bin"
_pkgname="museeks"
pkgver="0.23.4"
pkgrel="1"
pkgdesc="A lightweight and cross-platform music player."
arch=("x86_64")
url="http://museeks.io"
license=("MIT")
depends=("gtk2" "cairo" "freetype2" "fontconfig" "nss" "alsa-lib" "ttf-font" "webkit2gtk-4.1")
provides=("museeks")
conflicts=("museeks" "museeks-git")

sha256sums=("27686a3161d394679e91961cb015961aeb4555431016c69a08e2b443d60808f2")

source=("https://github.com/martpie/museeks/releases/download/0.23.4/Museeks-0.23.4-1.x86_64.rpm")

package() {
  cp -a $srcdir/usr $pkgdir/
}
