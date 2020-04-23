# Maintainer: Francisco Salces Carcoba <pacosalces@gmail.com>
pkgname=python-allantools
_name=AllanTools
pkgver=2019.9
pkgrel=1
pkgdesc="A python library for calculating Allan deviation and related time & frequency statistics."
license=("LGPL")
url="https://pypi.python.org/pypi/AllanTools/"
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('d2164cf6fe6ea804413dcf5dc2465804')
arch=('any')

build() {
	cd $srcdir/${_name}-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/${_name}-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build 
}
