# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-menu
pkgver=22.04.2
pkgrel=3
pkgdesc="Advanced menu for MATE Panel, a fork of MintMenu"
arch=('any')
url="https://github.com/ubuntu-mate/mate-menu"
license=('GPL')
depends=('mate-panel' 'python-configobj' 'python-gobject' 'python-pyinotify' 'python-xdg' 'python-xlib' 'xdg-utils' 'python-setproctitle' 'mate-menus' 'python-cairo')
makedepends=('python-distutils-extra' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ubuntu-mate/mate-menu/archive/$pkgver.tar.gz")
sha256sums=('36aa865b72664b8cc90d9c1c429fd3c44e2c198369aae4eaaa87228a5add075c')
install=$pkgname.install

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
