# $Id: PKGBUILD,v 1.4 2008/05/20 16:34:03 BaSh Exp $
# Maintainer: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=gtk-chtheme
pkgver=0.3.1
pkgrel=4
pkgdesc="This little program lets you change your Gtk+ 2.0 theme. A better alternative to switch2"
arch=('i686' 'x86_64')
license=('GPL')
url="http://plasmasturm.org/programs/gtk-chtheme/"
depends=('gtk2')
source=(http://plasmasturm.org/programs/gtk-chtheme/$pkgname-$pkgver.tar.bz2)
md5sums=('f688053bf26dd6c4f1cd0bf2ee33de2a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  install -m755 gtk-chtheme $startdir/pkg/usr/bin/ || return 1
}
