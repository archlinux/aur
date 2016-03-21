# Maintainer: goetzc
# Contributor: grimi

pkgname=xcursor-breeze
epoch=1
pkgver=5.5
pkgrel=1
pkgdesc="Breeze cursor theme (KDE Plasma 5)"
arch=('any')
url="https://quickgit.kde.org/?p=breeze.git"
license=('GPL')
depends=('libxcursor')
conflicts=('breeze')
source=("breeze-cursors-${pkgver}.tgz::https://quickgit.kde.org/?p=breeze.git&a=snapshot&h=9b142a15d494c4d9d8cc48cb051357d39b508cd6&f=cursors%2FBreeze%2FBreeze&fmt=tgz")
md5sums=('SKIP')

package() {
  install -dm755 "$pkgdir"/usr/share/icons/
  cp -r "$srcdir"/breeze/cursors/Breeze/Breeze/ "$pkgdir"/usr/share/icons/
}
