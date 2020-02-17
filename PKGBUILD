# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-menu
pkgver=20.04.1
pkgrel=2
pkgdesc="Advanced menu for MATE Panel, a fork of MintMenu"
arch=('any')
url="https://github.com/ubuntu-mate/mate-menu"
license=('GPL')
depends=('mate-panel' 'python-configobj' 'python-gobject' 'python-pyinotify' 'python-xdg' 'python-xlib' 'xdg-utils' 'python-setproctitle' 'mate-menus' 'python-cairo')
makedepends=('python-distutils-extra' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ubuntu-mate/mate-menu/archive/$pkgver.tar.gz")
sha256sums=('1cb702b9d05d695df4f591a1a53e2245009ec325da964c7570b13d4b5a0af7da')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
