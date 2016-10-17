# Maintainer: goetzc
# Contributors: Ner0

pkgname=gtk-theme-elementary
pkgver=5.0.2
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
sha256sums=('67429ef41f3ad9c2208267b7f24eb0282005b9e29ff682d26eb55416da63b7ae')

package() {
  cd elementary

  install -d $pkgdir/usr/share/themes
  mv $srcdir/elementary $pkgdir/usr/share/themes
}
