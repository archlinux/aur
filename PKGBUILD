# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=chbg-bin
pkgver=2.0.1
pkgrel=2
pkgdesc="Periodically change background image in X11. Can be a slideshow screensaver too"
arch=("x86_64")
url="http://chbg.sourceforge.net/about.html"
license=("GPLv2")
depends=("gtk2" "imlib2")
provides=("chbg")
conflicts=("chbg" "chbg-git")
source=("$pkgname-$pkgver::https://raw.githubusercontent.com/rpmsphere/x86_64/master/c/chbg-$pkgver-29.1.x86_64.rpm")
md5sums=("a30ed5f9859e4026fce745e7d6696ed1")

package() {
  mv etc "${pkgdir}"
  mv usr "${pkgdir}"
}
