# Contributor: Mario Blättermann <mariobl@gnome.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=clickosquare
pkgver=0.0.1
pkgrel=2
arch=('i686' 'x86_64')
depends=('gtk2')
pkgdesc="mind-developing game written in pure C, Gtk+ 2.0 and some OpenGL."
url="https://sourceforge.net/projects/clickomatic/"
license=('BSD')
source=(https://downloads.sourceforge.net/project/clickomatic/clickosquare-src/0.0.1/clickosquare-0.0.1.src.tar.bz2)
md5sums=('146037721ef7ad4cc5e9ad9a22a5bd99')

build() {
  cd $srcdir/$pkgname-src
  make
}
package() {
  cd $srcdir/$pkgname-src
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 README $pkgdir/usr/share/licenses/$pkgname/README
}
