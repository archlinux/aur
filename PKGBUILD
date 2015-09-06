# Maintainer: goetzc
# Contributors: Ner0

pkgname=gtk-theme-elementary
pkgver=4.0.6
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
md5sums=('d2a39e5842dd157edbed00992090730c')

package() {
  cd elementary

  install -d $pkgdir/usr/share/themes
  mv $srcdir/elementary $pkgdir/usr/share/themes
}
