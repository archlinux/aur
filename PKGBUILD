# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=yeahlaunch
pkgver=0.2
pkgrel=2
pkgdesc="Very simple application launcher which puts a horizontal menu on top of your screen."
arch=(i686 x86_64)
url="http://phrat.de/yeahtools.html"
license=('GPL')
groups=('yeahtools')
depends=('libx11')
makedepends=('gcc' 'make')
#install=
source=(http://phrat.de/$pkgname-$pkgver.tar.gz)
md5sums=('17519b8924fdb1fac1455e34a3f1539e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 0755 yeahlaunch "$pkgdir/usr/bin/yeahlaunch"
  install -D -m 0644 README "$pkgdir/usr/share/yeahtools/yeahlaunch.README"
}
# vim:set ts=2 sw=2 et:
