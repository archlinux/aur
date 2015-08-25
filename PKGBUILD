# Maintainer: haru_nak <uobikiemukot at gmail dot com>
pkgname=yaftx
_pkgname=yaft
pkgver=0.2.9
pkgrel=2
pkgdesc="X Window System port of yaft (yet another framebuffer terminal)"
arch=('i686' 'x86_64')
url="https://github.com/uobikiemukot/"
license=('MIT')
makedepends=('ncurses')
source=($url/$_pkgname/archive/v$pkgver.tar.gz)
backup=(usr/share/terminfo/y/yaft-256color)

build() {
  cd $srcdir/$_pkgname-$pkgver
  make yaftx
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make DESTDIR=$pkgdir installx
}
md5sums=('ddcbe929c51c453b01e3d18579b0860a')
