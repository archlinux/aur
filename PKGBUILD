# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=pyarchay
pkgdesc="A simple python scrip to display an OS logo in ASCII art along with basic system information."
pkgver=0.6.2
pkgrel=1
url="https://pypi.python.org/pypi/pyarchey/"
license=('GPL')
arch=('any')
depends=('python' 
	 'python-psutil') 
source="https://pypi.python.org/packages/source/p/pyarchey/pyarchey-${pkgver}.tar.gz"
md5sums=('c48f20072d1a167140a3f91b4bf3e597')

package(){
	tar -zxvf pyarchey-${pkgver}.tar.gz
	cd pyarchey-${pkgver}
	python setup.py install --root="${pkgdir}" --optimize=1
}

