# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=python-sphinxcontrib-fulltoc
pkgdesc="Include a full table of contents in your Sphinx HTML sidebar"
pkgver=1.1
pkgrel=1
url="https://pypi.python.org/pypi/sphinxcontrib-fulltoc"
license=('GPL')
arch=('any')
depends=('python' 
	 'python-sphinx')
source="https://pypi.python.org/packages/source/s/sphinxcontrib-fulltoc/sphinxcontrib-fulltoc-1.1.tar.gz"
md5sums=('eaebcd42fee9ead0d4c7916c1d6d43fd')

package(){
	tar -zxvf sphinxcontrib-fulltoc-${pkgver}.tar.gz
	cd sphinxcontrib-fulltoc-${pkgver}
	python setup.py install --root="${pkgdir}" --optimize=1
}

