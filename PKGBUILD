# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname='python2-digitalocean'
pkgver=1.0.8
pkgrel=1
pkgdesc="Digital Ocean python API"
arch=('any')
url="https://pypi.python.org/pypi/python-digitalocean"
license=('GPL')
depends=('python2-requests')
source=("https://pypi.python.org/packages/source/p/python-digitalocean/python-digitalocean-${pkgver}.tar.gz")
sha256sums=('4d7bf2539cb4950f335abff35ffe811eafff28546af23dd81d74f39c8f867345')

build() {
  cd "${srcdir}/python-digitalocean-${pkgver}"
	
	python2 setup.py build
}

package() {
  cd "${srcdir}/python-digitalocean-${pkgver}"
	
	python2 setup.py install --prefix=/usr --root="${pkgdir}"
}

# vim: set ts=2 sw=2 ft=sh noet:
