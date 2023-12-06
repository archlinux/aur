# Maintainer: Matthew Sexton <mssxtn@gmail.com>
# Contributor: Simon Tas <simon.tas.st@gmail.com>

pkgname="python-pylspci"
_pkgname="pylspci"
pkgver=0.4.3
pkgrel=1
pkgdesc="A Python parser for the lspci command from the pciutils package."
arch=('any')
url="https://pypi.python.org/pypi/$_pkgname"
license=('GPL3')
depends=('python-cached-property')
makedepends=('git' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/15/6d/609005b317d50e277cc78e4971e9e895f1b210c51fb55352e5586c34e0eb/pylspci-0.4.3.tar.gz")

md5sums=('db661659ecebee5227ca8d5071c0cfdd')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
