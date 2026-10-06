# Maintainer: Elven Inquisition <no.one.expects@faerie.me>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-menu
pkgver=26.10.1
pkgrel=1
pkgdesc="Advanced menu for MATE Panel, a fork of MintMenu"
arch=('any')
url="https://github.com/ubuntu-mate/mate-menu"
license=('GPL-2.0-or-later')
depends=('mate-panel' 'python-configobj' 'python-gobject' 'python-pyinotify' 'python-xdg' 'python-xlib' 'xdg-utils' 'python-setproctitle' 'mate-menus' 'python-cairo')
makedepends=('python-distutils-extra' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ubuntu-mate/mate-menu/archive/$pkgver.tar.gz")
sha512sums=('c40ae38a6cf7cdae7f8abf281bb1381d48cddcf702a7e11042e026d86a3b90d6c1ba23d0cbe91cb9fe2bec0f2664e0a39bd6300b9659081168977264437a18f8')
b2sums=('3cc48da47fce7b0fd7384d5af8d77db7fb2baa4ea388fde1d5fe7bf74d0dbbb02b29ab876a5aacea67c5ece34e39b4b16f2925e131d916112d55e36335ead6e1')
install=$pkgname.install

package() {
	cd $pkgname-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
