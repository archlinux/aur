# Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname="python-pylspci"
_pkgname="pylspci"
pkgver=0.4.2
pkgrel=1
pkgdesc="A Python parser for the lspci command from the pciutils package."
arch=('any')
url="https://pypi.python.org/pypi/$_pkgname"
license=('GPL3')
depends=('python-cached-property')
makedepends=('git' 'python-setuptools')
source=("git+https://gitlab.com/Lucidiot/pylspci.git#tag=$pkgver")
md5sums=('SKIP')

build() {
	cd ${srcdir}/${_pkgname}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
