# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildstream
pkgver=1.1.2
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
sha256sums=('47371c2aacdb4ea5efd3adda2ee4f872547ede310c4cb2381035ce184ad5cd57')

package() {
	cd BuildStream-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1
}
