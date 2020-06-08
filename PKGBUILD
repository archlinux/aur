# Maintainer: Tobias Brox <t-arch@tobixen.no>
pkgname=calendar-cli
pkgver=0.12.0
pkgrel=1
pkgdesc="calendar-cli is a caldav client for calendar and task management"
url="https://github.com/tobixen/calendar-cli"
arch=('any')
license=('GPL')
depends=('python' 'python-caldav' 'python-icalendar' 'python-pytz' 'python-vobject' 'python-tzlocal' 'python-six')
source=("https://github.com/tobixen/$pkgname/archive/v$pkgver.tar.gz")

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cd "$srcdir/$pkgname-$pkgver/"
  cp calendar-cli "$pkgdir/usr/bin/"
  chmod a+x "$pkgdir/usr/bin/calendar-cli"
}


md5sums=('a0d4ed9621d93d9e0ae182e6d09583d1')
