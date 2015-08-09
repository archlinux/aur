# Contributor: Jochen Immendörfer <jochen dot immendoerfer at gmail dot com>
# Maintainer: philanecros <philanecros at gmail dot com>

pkgname=fxload
pkgver=2008_10_13
pkgrel=6
pkgdesc="fxload firmware loader. Used with udev or devfs/hotplug."
url="http://linux-hotplug.sourceforge.net/"
depends=('glibc')
source=(http://downloads.sourceforge.net/sourceforge/linux-hotplug/$pkgname-$pkgver.tar.gz)
md5sums=('4477a2457f064228bef4a93ba2f21692')
arch=('i686' 'x86_64')
license=('GPL')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir" sbindir="$pkgdir/usr/bin" install
}
