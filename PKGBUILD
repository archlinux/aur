# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-svg-clock  
pkgver=0.1
pkgrel=1
pkgdesc="Analog clock which uses Scalable Vector Graphics for rendering"
url="http://old.nabble.com/attachment/32520777/0/svg-clock.el"
arch=('any')
license=('GPL')
source=(http://old.nabble.com/attachment/32520777/0/svg-clock.el)
md5sums=('5027fea60b90ecc233d1386554c7232b')
install=svg-clock.install
package() {
  install -Dm644 svg-clock.el $pkgdir/usr/share/emacs/site-lisp/svg-clock.el
}
