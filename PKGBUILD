# $Id: PKGBUILD,v 1.3 2006/02/19 23:47:01 simo Exp $
# Maintainer: Simo Leone <simo@archlinux.org>

pkgname=trayer
pkgver=1.0
pkgrel=2
pkgdesc="Swallows GTK 1.2/2.x application docklets, and KDE docklets."
url="http://fvwm-crystal.org"
license=""
depends=('gtk2')
source=(http://download.gna.org/fvwm-crystal/trayer/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('e1b0b6464f991f2c296561e377585867')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  make PREFIX=$startdir/pkg/usr install
}
