# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Krzysztof Malinowski <boromil@gmail.com>

pkgname=alarm-clock
pkgver=1.4.7
pkgrel=1
pkgdesc="Alarm clock to schedule your tasks"
depends=('gtk2' 'gstreamer' 'libunique' 'libnotify')
makedepends=('intltool')
arch=('i686' 'x86_64')
license=('GPL2')
source=("https://github.com/shaggytwodope/alarm-clock/archive/v$pkgver.tar.gz")
options=('!libtool')
url="https://github.com/shaggytwodope/alarm-clock"
md5sums=('0a98e3a1fc128ac0bc0190854b375f0d')

package() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}
