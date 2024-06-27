# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=python-meh
pkgname=(python-meh python2-meh)
pkgver=0.52
pkgrel=1
pkgdesc='Python module for handling exceptions'
arch=('i686' 'x86_64')
url='https://github.com/rhinstaller/python-meh/'
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/rhinstaller/${pkgbase}/archive/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('7b66046b4693e7631aad299e5a55d0255962608cd03372f559745c575aa8c920')

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

