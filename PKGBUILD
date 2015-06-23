# Maintainer: John Jenkins shaggytwodope@gmail.com
# Contirbutor: demonicmanic <namida1@gmx.net>

pkgname=clock-git
pkgver=20120504
pkgrel=1
pkgdesc="Displays time on terminal in diffrent ways."
arch=('x86_64' 'i686')
url="https://github.com/mogria/clock.git"
source=("git+git://github.com/mogria/clock.git")
license=('MIT')
depends=()
md5sums=("SKIP")
_gitname="clock"

build() {
  cd $srcdir/$_gitname/src
  gcc $CFLAGS uhr.c -lm -o uhr
}

package() {
  cd $srcdir/$_gitname/src
  install -Dm755 uhr "$pkgdir/usr/bin/uhr"
}

# vim:set ts=2 sw=2 et:
