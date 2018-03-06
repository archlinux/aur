# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildstream
pkgver=1.1.1
pkgrel=1
pkgdesc="Framework for modelling build pipelines in a declarative YAML format"
arch=('any')
url="https://wiki.gnome.org/Projects/BuildStream/"
license=('LGPL')
depends=('bubblewrap' 'ostree' 'python-blessings' 'python-click'
         'python-fusepy' 'python-jinja' 'python-gobject' 'python-pluginbase'
         'python-psutil' 'python-ruamel-yaml')
makedepends=('python-setuptools')
source=("https://download.gnome.org/sources/BuildStream/${pkgver%.*}/BuildStream-$pkgver.tar.xz")
sha256sums=('a8ce204d5c56cd9f9dddbbd156161dbcbf71413207bd867efdd05588fd9a8432')

package() {
	cd BuildStream-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1
}
