# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=birthday
pkgver=1.5
pkgrel=2
pkgdesc="A program that outputs reminders for upcoming events (e.g. birthdays)"
url="http://www.freshports.org/misc/birthday/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("ftp://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/$pkgname-$pkgver.tar.gz")
md5sums=('d2ceb7ca58d998645a4bdc04d986139c')

build() {
    cd $srcdir/$pkgname-$pkgver

    make
}

package() {
    cd $srcdir/$pkgname-$pkgver

    make DESTDIR=$pkgdir install
}
