# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=birthday
pkgver=1.5
pkgrel=1
pkgdesc="A program that outputs reminders for upcoming events (e.g. birthdays)"
url="http://www.freshports.org/misc/birthday/"
license="GPL"
depends=('glibc')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(ftp://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/$pkgname-$pkgver.tar.gz)
md5sums=('d2ceb7ca58d998645a4bdc04d986139c')

build() {
  cd $startdir/src/$pkgname-$pkgver
	
  make || return 1
  make DESTDIR=$startdir/pkg install
}
