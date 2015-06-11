# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Vitaliy Berdinskikh <skipper13@root.ua>

pkgname=rem2ics
pkgver=0.93
pkgrel=1
pkgdesc="A script that will convert Remind events to iCalendar format"
arch=('any')
url="http://mark.atwood.name/code/"
license=('GPL2')
depends=('perl' 'remind')
source=(http://mark.atwood.name/code/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('859e834d7b09b8e4ec93885a25464222')

package() {
  cd $srcdir
  make -f rem2ics-Makefile DESTDIR=$pkgdir install || return 1
}

