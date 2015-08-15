# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=python-hgapi
pkgdesc="Python API to Mercurial using the command-line interface."
pkgver=1.7.2
pkgrel=1
url="https://pypi.python.org/pypi/hgapi"
license=('GPL')
arch=('any')
depends=('python') 
source="https://pypi.python.org/packages/source/h/hgapi/hgapi-${pkgver}.tar.gz"
md5sums=('7ccb6b331b3bb736a5726fdb92d12abd')

package(){
	tar -zxvf hgapi-${pkgver}.tar.gz
	cd hgapi-${pkgver}
	python setup.py install --root="${pkgdir}" --optimize=1
}

