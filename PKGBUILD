# Maintainer: goetzc
# Contributors: Ner0

pkgname=gtk-theme-elementary
pkgver=4.0.4
pkgrel=1
pkgdesc="The official elementary GTK theme designed to be smooth, attractive, fast, and usable."
arch=('any')
url="https://launchpad.net/egtk"
license=('GPL2')
groups=('pantheon')
depends=('gtk-engine-murrine')
optdepends=('elementary-icon-theme: the elementary icon theme')
conflicts=('elementary-gtk-theme' 'egtk-bzr')
source=("$pkgname-$pkgver.tar.xz::https://launchpad.net/egtk/4.x/$pkgver/+download/elementary.tar.xz")
md5sums=('89388e3c31db64fb57a0aabdb544a636')

package() {
  cd elementary

  install -d $pkgdir/usr/share/themes
  mv $srcdir/elementary $pkgdir/usr/share/themes
}
