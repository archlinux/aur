# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Leonid Selivanov <bravebug at gmail dot com>

pkgname=retrovol
pkgver=0.13
pkgrel=1
pkgdesc="An sound volume mixer"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://puppylinux.svn.sourceforge.net/viewvc/puppylinux/retrovol/"
groups=()
depends=('gtk2')
makedepends=()
optdepends=()
options=()
install=
source=(http://www.browserloadofcoolness.com/software/puppy/PETget/$pkgname-$pkgver.tar.gz)
md5sums=('a1743550aa17c87f525fa6a7c58ec82f')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}
package() {
  cd ${srcdir}/$pkgname-$pkgver
  make DESTDIR=${pkgdir} install
}
