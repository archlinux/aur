# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgbase=python-lunardate
pkgname=('python-lunardate'
	 'python2-lunardate')
pkgdesc="A Chinese Calendar Library in Pure Python"
pkgver=0.1.5
pkgrel=1
url="https://pypi.python.org/pypi/lunardate"
license=('GPLv3')
arch=('any')
source="https://pypi.python.org/packages/source/l/lunardate/lunardate-${pkgver}.tar.gz"
md5sums=('7a7ca79f68ccea1d0981286ef9af1cc5')

package_python-lunardate(){
	depends=('python')
        cd "${srcdir}/lunardate-${pkgver}"
        python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-lunardate(){
	depends=('python2')
	cd "${srcdir}/lunardate-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}

