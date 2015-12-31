# Maintainer: Andreas Nüßlein <nutz@noova.de>

pkgname=rcswitch-pi
pkgver=1
pkgrel=1
pkgdesc="rcswitch-pi is for controlling rc remote controlled power sockets with the raspberry pi."
arch=('i686' 'x86_64' 'armv6h')
depends=('wiringpi')
url="https://github.com/nutztherookie/rcswitch-pi"
source=("git+https://github.com/nutztherookie/rcswitch-pi.git")
md5sums=('SKIP')

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm0755 send "$pkgdir/usr/local/bin/send"
}

# vim: ft=sh syn=sh
