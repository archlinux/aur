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
source=("https://files.pythonhosted.org/packages/c2/9a/e963a7596af926fd5dfb54f5c9411930a4929fed42915852b3477986a46a/pylspci-0.4.2.tar.gz")
md5sums=('39c3481b4bcd306a9afded95be0db661')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
