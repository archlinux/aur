# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-menu
pkgver=19.04.0
pkgrel=1
pkgdesc="Advanced menu for MATE Panel, a fork of MintMenu"
arch=('any')
url="https://github.com/ubuntu-mate/mate-menu"
license=('GPL')
depends=('mate-panel' 'python-configobj' 'python-gobject' 'python-pyinotify' 'python-xdg' 'python-xlib' 'xdg-utils' 'python-setproctitle' 'mate-menus' 'python-unidecode')
makedepends=('python-distutils-extra' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ubuntu-mate/mate-menu/archive/$pkgver.tar.gz")
sha256sums=('dbcf2af2c12fbbf4a9014aecd42f46ff159ff94a2d1efc0603abc5431a06a3aa')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
