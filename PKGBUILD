# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-svg-clock  
pkgver=1.0
pkgrel=2
pkgdesc="Analog clock which uses Scalable Vector Graphics for rendering"
url="https://elpa.gnu.org/packages/svg-clock.html"
arch=('any')
license=('GPL')
source=(https://elpa.gnu.org/packages/svg-clock-1.0.el)
md5sums=('5ab157f4bee2f0992d6e08d2703062a6')
install=svg-clock.install

package() {
  install -Dm644 svg-clock-1.0.el "$pkgdir"/usr/share/emacs/site-lisp/svg-clock.el
}
