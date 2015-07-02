# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname='python2-digitalocean'
pkgver=1.6
pkgrel=1
pkgdesc="Digital Ocean python API"
arch=('any')
url="https://pypi.python.org/pypi/python-digitalocean"
license=('GPL')
depends=('python2-requests')
source=("https://pypi.python.org/packages/source/p/python-digitalocean/python-digitalocean-${pkgver}.tar.gz")
sha256sums=('b919f142fb40e8b851a565d568fba1a767fb70e97ca843638c3dd6fc48efca66')

build() {
  cd "${srcdir}/python-digitalocean-${pkgver}"
	
	python2 setup.py build
}

package() {
  cd "${srcdir}/python-digitalocean-${pkgver}"
	
	python2 setup.py install --prefix=/usr --root="${pkgdir}"
}

# vim: set ts=2 sw=2 ft=sh noet:
