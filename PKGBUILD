# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=python-meh
pkgname=(python-meh python2-meh)
pkgver=0.51
pkgrel=1
pkgdesc='Python module for handling exceptions'
arch=('i686' 'x86_64')
url='https://github.com/rhinstaller/python-meh/'
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/rhinstaller/${pkgbase}/archive/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('07b57a71b886e34d5062c870724797af67973ff8cb19ef9456d453c068559e93')

package_python-meh() {
	pkgdesc='Python module for handling exceptions - python 3.x pkg'
	depends=('python' 'python-dbus' 'libreport')

	cd "${srcdir}/${pkgbase}-${pkgbase}-${pkgver}"
	python3 setup.py install --root="${pkgdir}/" --optimize=0
}

package_python2-meh() {
	pkgdesc='Python module for handling exceptions - python 2.x pkg'
	depends=('python2' 'python2-dbus' 'libreport')

	cd "${srcdir}/${pkgbase}-${pkgbase}-${pkgver}"
	python2 setup.py install --root="${pkgdir}/" --optimize=0
}

