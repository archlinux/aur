# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildstream
pkgver=1.1.0
pkgrel=2
pkgdesc="Framework for modelling build pipelines in a declarative YAML format"
arch=('any')
url="https://wiki.gnome.org/Projects/BuildStream/"
license=('LGPL')
depends=('bubblewrap' 'ostree' 'python-blessings' 'python-click'
         'python-fusepy' 'python-jinja' 'python-gobject' 'python-pluginbase'
         'python-psutil' 'python-ruamel-yaml')
makedepends=('python-setuptools')
source=("https://download.gnome.org/sources/BuildStream/${pkgver%.*}/BuildStream-$pkgver.tar.xz")
sha256sums=('5cc7193758a92f288e8faa16a1f0f89c46363450b98267d0c321a3fb1941726e')

package() {
	cd BuildStream-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1
}
