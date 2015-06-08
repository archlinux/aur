# Contributor: fl4ppie at gmail dot com
# Contributor: bender02 at gmx dot com
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-planner
pkgver=3.42
pkgrel=3
pkgdesc="PlannerMode: a Personal Information Management tool."
url="http://www.emacswiki.org/cgi-bin/wiki/PlannerMode"
arch=('any')
license=('GPL3')
depends=('emacs-muse')
install=$pkgname.install
source=(http://download.gna.org/planner-el/planner-$pkgver.tar.gz)
md5sums=('904774959e64f0edbb587bc6f732b39b')

build() {
  cd $srcdir/planner-$pkgver
  make
}

package() {
  cd $srcdir/planner-$pkgver
  make INFODIR=$pkgdir/usr/share/info PREFIX=$pkgdir/usr install
}
