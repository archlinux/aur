# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Jan Fader <jan.fader@web.de>
pkgname=keynav
pkgver=0.20110708.0
pkgrel=2
pkgdesc="Ingenious and fast way to move the mouse pointer on the screen with keystrokes."
url="http://www.semicomplete.com/projects/keynav/"
license=('BSD')
arch=('i686' 'x86_64')
depends=('xdotool')
source=("http://semicomplete.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('d1b273d72b15fc9c28270c28f644e7c6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make keynav
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D keynav   "$pkgdir/usr/bin/keynav"
  install -D keynavrc "$pkgdir/etc/keynavrc"
}

# vim:set ts=2 sw=2 et:
