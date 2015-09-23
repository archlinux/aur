# $Id: PKGBUILD 9127 2008-08-17 04:01:22Z allan $
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=duhdraw
pkgver=2.8.13
pkgrel=3
pkgdesc="A program which almost perfectly simulates TheDraw for DOS."
arch=('i686' 'x86_64')
depends=('ncurses')
url="http://www.cs.helsinki.fi/u/penberg/duhdraw/"
license=('GPL2')
source=($url/$pkgname-$pkgver.tar.gz)
md5sums=('70211aa3ea927704ffeb9093e4f433b9')
sha1sums=('b33eaa8c0b90638f1e9979bd26db02a0faba8e33')
sha256sums=('12a432d2874a6f0579879e3242d832139b7f2a4879b2cfcfb6ced046236b4b2c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  install -m0755 ansi ansitoc duhdraw $pkgdir/usr/bin
}

