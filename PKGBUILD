# Maintainer: Javier Novoa C. <jstitch@gmail.com>
pkgname=masterm
pkgver=1.1.1b
pkgrel=1
pkgdesc="MasterMind"
arch=('any')
url="https://gitlab.com/jstitch/masterm"
license=('GPL2')
depends=('ncurses')
source=('git+https://gitlab.com/jstitch/masterm.git')
md5sums=('SKIP')

build() {
   cd "$srcdir/masterm"
   make all
}
package() {
   install -dm 755 $pkgdir/usr/bin
   install -D -m755 "$srcdir/masterm/masterm" $pkgdir/usr/bin
}
