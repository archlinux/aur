# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgbase=python-workalendar
pkgname=('python-workalendar'
	 'python2-workalendar')
pkgdesc="Worldwide holidays and working days helper and toolkit"
pkgver=0.4.2
pkgrel=1
url="https://pypi.python.org/pypi/workalendar"
license=('MIT')
arch=('any')
source="https://pypi.python.org/packages/source/w/workalendar/workalendar-${pkgver}.tar.gz"
md5sums=('64e3fcb9ebcbd978bb289c650e8a9c1c')

package_python-workalendar(){
	depends=('python'
	         'python-lunardate'
		 'python-pycalverter')
	cd "$srcdir/workalendar-${pkgver}"
	python2 setup.py install --root="${pkgdir}/" --optimize=1
}


package_python2-workalendar(){
	depends=('python2'
	         'python2-lunardate'
	         'python2-pycalverter')
        cd "$srcdir/workalendar-${pkgver}"
        python setup.py install --root="${pkgdir}/" --optimize=1
}
