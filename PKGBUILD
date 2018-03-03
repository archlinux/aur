# Maintainer: Ernesto Castellotti <erny.castell@gmail.com>

_pkgname=python-meh
pkgname=$_pkgname-git
pkgver=0191fa9
pkgrel=1
pkgdesc='Python module for handling exceptions - python 3.x pkg'
arch=('i686' 'x86_64')
url='https://github.com/rhinstaller/python-meh/'
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("git+https://github.com/rhinstaller/python-meh.git")
sha256sums=('SKIP')

package() {
	pkgdesc='Python module for handling exceptions - python 3.x pkg'
	depends=('python' 'python-dbus' 'libreport-git')

	cd "${srcdir}/${_pkgname}"
	python3 setup.py install --root="${pkgdir}/" --optimize=0
}


 
