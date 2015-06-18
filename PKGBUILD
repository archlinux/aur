# Maintainer: sputnick
# Contributor: Ner0

pkgname=glipper
pkgver=2.4
pkgrel=4
pkgdesc="Clipboard manager for GNOME"
arch=('any')
url="https://launchpad.net/glipper"
license=('GPL2')
depends=('python2' 'python2-gconf' 'python2-gobject2' 'pygtk' 'python2-keybinder2' 'python2-xdg' 'gconf' 'gtk-update-icon-cache' 'hicolor-icon-theme')
makedepends=('python2-distutils-extra')
source=("http://launchpad.net/glipper/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz")
md5sums=('a01b832771da95435ae9e1a1218dd334')

package() {
  cd $pkgname-$pkgver
  python2 ./setup.py install --root="$pkgdir/"
}
# vim:set ts=2 sw=2 et:
