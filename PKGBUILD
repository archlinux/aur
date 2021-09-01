# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: hobi82 <hobi82@gmx.net>
# Contributor: Marius Nestor <marius softpedia com>
pkgname=musictube
pkgver=1.15
pkgrel=1
pkgdesc="YouTube streaming music player"
arch=('x86_64')
url="https://flavio.tordini.org/musictube"
license=('unknown')
depends=('qt5-declarative' 'qt5-x11extras' 'mpv')
source=("$pkgname-$pkgver.deb::https://flavio.tordini.org/files/$pkgname/$pkgname.deb")
sha256sums=('f7e171614c1031e4b0fa04e15601bfafe46f3e10fe94dadf5d29a32fa8384076')

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir"

  # Remove deprecated app menu
  rm -rf "$pkgdir/usr/share/menu"
}
