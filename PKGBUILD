# Contributor: Javier ‘Phrodo_00‘ Aravena <phrodo.00@gmail.com>
pkgname=bzr-gtk
pkgver=0.98.0
pkgrel=1
pkgdesc="Plugin for Bazaar that aims to provide GTK+ interfaces to most Bazaar operations."
arch=('i686' 'x86_64')
url="http://bazaar-vcs.org/bzr-gtk"
license=('GPL')
depends=('pygtk' 'bzr' 'pycairo' 'libglade')
source=("http://edge.launchpad.net/bzr-gtk/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
md5sums=('a14ac163a88beb38106f6610a6441529')

build() {
  cd "${startdir}/src/${pkgname}-${pkgver}/"
  python setup.py install --prefix'=/usr' --root="${startdir}/pkg" || return 1
}

