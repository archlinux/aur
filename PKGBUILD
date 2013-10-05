# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=alltray-oldmaintenance
pkgver=0.71b
pkgrel=1
pkgdesc="AllTray old-maintenance series"
arch=('i686' 'x86_64')
url="http://alltray.trausch.us"
license=('GPL2')
makedepends=('gtk2>=2.2' 'gconf')
depends=('gtk2>=2.2' 'gconf')
conflicts=(alltray)
source=($pkgname-$pkgver.tar.gz::http://edge.launchpad.net/alltray/old-maintenance/$pkgver/+download/alltray-$pkgver.tar.gz)
noextract=()
md5sums=('93a866aa4dd96dc258eb3d7fccb41da8')

build () {
  cd "$srcdir/alltray-$pkgver"
  ./configure
  make
}

package () {
  cd "$srcdir/alltray-$pkgver"
  make DESTDIR="$pkgdir/" install
}
