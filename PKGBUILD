# Maintainer: sxe <sxxe@gmx.de>

pkgname='yakuake-sessions'
pkgdesc='Remember your yakuake session - directory, splitting terminal and virtual environment'
pkgver='1'
pkgrel='3'
arch=('i686' 'x86_64')
url='https://github.com/UfoDriver/yakuake-sessions'
license=('unknown')
depends=('qt4')
makedepends=('git')
source=('git://github.com/UfoDriver/yakuake-sessions.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/yakuake-sessions"
  qmake-qt4
  make
}

package() {
  cd "$srcdir/yakuake-sessions"
  install -Dm755 'yakuake-sessions' "$pkgdir/usr/bin/yakuake-sessions" 
}
