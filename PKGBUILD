# Maintainer: goetzc
# Contributors: Ner0

pkgname=gtk-theme-elementary
pkgver=5.0
pkgrel=1
pkgdesc="The official elementary GTK theme designed to be smooth, attractive, fast, and usable."
arch=('any')
url="https://launchpad.net/egtk"
license=('GPL2')
groups=('pantheon')
depends=('gtk-engine-murrine')
optdepends=('elementary-icon-theme: the elementary icon theme')
conflicts=('elementary-gtk-theme' 'egtk-bzr')
source=("$pkgname-$pkgver.tar.xz::https://launchpad.net/egtk/5.x/$pkgver/+download/elementary.tar.xz")
md5sums=('0c5269a3226a3e230bb3aad999611fac')

package() {
  cd elementary

  install -d $pkgdir/usr/share/themes
  mv $srcdir/elementary $pkgdir/usr/share/themes
}
