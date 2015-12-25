# Maintainer: Andreas Nüßlein <nutz@noova.de>

pkgname=rcswitch-pi
pkgver=1
pkgrel=0
pkgdesc="rcswitch-pi is for controlling rc remote controlled power sockets with the raspberry pi."
arch=('i686' 'x86_64' 'armv6h')
depends=('wiringpi')
url="https://github.com/r10r/rcswitch-pi"
source=("git+https://github.com/r10r/rcswitch-pi.git")
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
