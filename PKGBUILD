# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=lalcal
pkgver=1.0
pkgrel=2
pkgdesc="A clock/calendar for your system tray"
url="http://xerxesdaphat.googlepages.com/lalcal,aclockforyoursystemtray"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxft')
source=("http://xerxesdaphat.googlepages.com/$pkgname.tar.gz")
md5sums=('a8650b3fcd7e2639a3ed57d1952fc01b')

build() {
  cd "$srcdir/$pkgname"
  make
}
package() {
  cd "$srcdir/$pkgname"
  install -D $pkgname "$pkgdir/usr/bin/$pkgname"
}

