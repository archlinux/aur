# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgbase=python-pycalverter
pkgname=('python-pycalverter'
	 'python2-pycalverter')
pkgdesc="Python Calendar Converter"
pkgver=1.6.1
pkgrel=4
url="https://pypi.org/project/pyCalverter/"
license=('GPLv2')
arch=('any')
source=("https://pypi.python.org/packages/source/p/pyCalverter/pyCalverter-${pkgver}.tar.gz")
md5sums=('effad7428a5d9902965ad2c0d80152ee')

package_python-pycalverter(){
	depends=('python')
	cd "${srcdir}/pyCalverter-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-pycalverter(){
	depends=('python2')
        cd "${srcdir}/pyCalverter-${pkgver}"
        python2 setup.py install --root="${pkgdir}" --optimize=1
}

