# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Vitaliy Berdinskikh <skipper13@root.ua>

pkgname=rem2ics
pkgver=0.94
pkgrel=1
pkgdesc="A script that will convert Remind events to iCalendar format"
arch=('any')
url="http://mark.atwood.name/code/"
license=('GPL2')
depends=('perl' 'remind')
makedepends=('bzr')
source=('bzr+lp:rem2ics')
md5sums=('SKIP')

package() {
  cd $srcdir/rem2ics
  make -f rem2ics-Makefile DESTDIR=$pkgdir install || return 1
}

