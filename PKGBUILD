# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-menu
pkgver=19.10.2
pkgrel=2
pkgdesc="Advanced menu for MATE Panel, a fork of MintMenu"
arch=('any')
url="https://github.com/ubuntu-mate/mate-menu"
license=('GPL')
depends=('mate-panel' 'python-configobj' 'python-gobject' 'python-pyinotify' 'python-xdg' 'python-xlib' 'xdg-utils' 'python-setproctitle' 'mate-menus' 'python-unidecode' 'python-cairo')
makedepends=('python-distutils-extra' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ubuntu-mate/mate-menu/archive/$pkgver.tar.gz")
sha256sums=('29b3a0d81d59e7cc77ca1a5bc0fb304dd2c9ce4b7d11f864fb22cbdd2ebc8276')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
