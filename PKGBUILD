# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=bubblemon
pkgver=2.0.15
pkgrel=2
pkgdesc="Bubbling Load Monitoring Applet for the GNOME Panel"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/bubblemon/"
license=('GPL')
depends=('gnome-panel' 'libgtop')
makedepends=('intltool')
source=(http://savannah.nongnu.org/download/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('c79f04d72961e89e75afcfd38f4f0357')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}
