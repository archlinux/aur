# Maintainer: Sapphira Armageddos <shadowkyogre.public+aur <AT> gmail <DOT> com>

_id_path="39/19/f3ff31dc85c14ded9320884c5bfb9bf7de06e1c8441a30f70acc1ae617b0"
_upstream="asciimathml"

pkgname=python-asciimathml
pkgver=0.9.5.1
pkgrel=1
pkgdesc="ASCIIMathML to MathML translator (Python 3)"
arch=('any')
url="https://pypi.python.org/pypi/${_upstream}/"
license=('GPL2')
depends=('python')
optdepends=('python-markdown')
source=("https://pypi.python.org/packages/${_id_path}/${_upstream}-${pkgver}.tar.gz")

package() {
	cd "${srcdir}/${_upstream}-${pkgver}"
	python setup.py install --root="${pkgdir}"
}

md5sums=('108bbe42307ecb6f43f6aa2796d21a39')
