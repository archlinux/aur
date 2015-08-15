# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=python-igraph
pkgdesc="Python library for interacting with JIRA via REST APIs."
pkgver=0.7.1
pkgrel=1
url="http://igraph.org/python/"
license=('GPL')
arch=('any')
depends=('python') 
source="https://pypi.python.org/packages/source/p/python-igraph/python-igraph-${pkgver}.post6.tar.gz"
md5sums=('a4c0b5960735b36adb5d3a40031cb7c0')

package(){
	tar -zxvf python-igraph-${pkgver}.post6.tar.gz
	cd python-igraph-${pkgver}.post6
	python setup.py install --root="${pkgdir}" --optimize=1
}

