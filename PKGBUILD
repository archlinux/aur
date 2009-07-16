# $Id: PKGBUILD,v 1.3 2008/05/20 16:29:19 BaSh Exp $
# Maintainer: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=gtk2fontsel
pkgver=0.1
pkgrel=2
pkgdesc="Font selection and preview tool"
arch=('i686' 'x86_64')
license=('GPL')
url="http://gtk2fontsel.sourceforge.net/"
depends=('gtk2')
source=(http://downloads.sourceforge.net/gtk2fontsel/$pkgname-$pkgver.tar.gz)
md5sums=('f344018b19b6a818795a4c702770cd9d')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}


