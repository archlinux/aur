# Maintainer: goetzc
# Contributors: Ner0

pkgname=gtk-theme-elementary
pkgver=4.0.3
pkgrel=1
pkgdesc="The official elementary GTK theme designed to be smooth, attractive, fast, and usable."
arch=('any')
url="https://launchpad.net/egtk"
license=('GPL2')
groups=('pantheon')
depends=('gtk-engine-murrine')
optdepends=('elementary-icon-theme: the elementary icon theme')
conflicts=('elementary-gtk-theme' 'egtk-bzr')
source=("$pkgname-$pkgver.tar.gz::https://launchpad.net/egtk/4.x/$pkgver/+download/elementary.tar.gz")
md5sums=('ddd7a10fa56acfc85b53350f28ed521c')

package() {
  cd elementary

  install -d $pkgdir/usr/share/themes
  mv $srcdir/elementary $pkgdir/usr/share/themes
}
