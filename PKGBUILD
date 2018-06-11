# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=chbg-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Periodically change background image in X11. Can be a slideshow screensaver too"
arch=("x86_64")
url="http://chbg.sourceforge.net/about.html"
license=("GPLv2")
depends=("gtk2" "imlib2")
provides=("chbg")
conflicts=("chbg" "chbg-git")
source=("$pkgname-$pkgver::http://ftp.gwdg.de/pub/opensuse/repositories/home:/zhonghuaren/Fedora_28/x86_64/chbg-$pkgver-29.1.x86_64.rpm")
md5sums=("2dd751245bb079f3233acb9203948bec")

package() {
  mv etc "${pkgdir}"
  mv usr "${pkgdir}"
}
