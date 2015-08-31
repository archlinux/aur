# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=python-meh
pkgname=(python-meh python2-meh)
pkgver=0.40
_realver="r${pkgver}-1"
pkgrel=1
pkgdesc='Python module for handling exceptions'
arch=('i686' 'x86_64')
url='https://github.com/rhinstaller/python-meh/'
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${pkgbase}-${_realver}.tar.gz::https://github.com/rhinstaller/${pkgbase}/archive/${_realver}.tar.gz")
sha256sums=('59827d2d09a757cd05897321be6d8edc7627dd224ca4b440643930b06356b8fd')

package_python-meh() {
	pkgdesc='Python module for handling exceptions - python 3.x pkg'
	depends=('python')

	cd "${srcdir}/${pkgbase}-${_realver}"
	python3 setup.py install --root="${pkgdir}/" --optimize=0
}

package_python2-meh() {
	pkgdesc='Python module for handling exceptions - python 2.x pkg'
	depends=('python2')

	cd "${srcdir}/${pkgbase}-${_realver}"
	python2 setup.py install --root="${pkgdir}/" --optimize=0
}

