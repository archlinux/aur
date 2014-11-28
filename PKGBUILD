# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Bartlomiej Palmowski (Rotwang), maks1k at wp dot pl

pkgname=ck4up
pkgver=1.3
pkgrel=1
pkgdesc="Command-line utility to monitor web pages for updates"
arch=('any')
url="http://jue.li/crux/ck4up/"
license=('GPL')
depends=('ruby')
source=(http://jue.li/crux/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('c3a3e36dc7a32b23a56390db00c963ac')

package() {
  cd $pkgname-$pkgver

  make DESTDIR="${pkgdir}" MANDIR=/usr/share/man/man1 install
}
