# Maintainer: Stunts <f.pinamartins@gmail.com>

pkgname=python-matplotlib-venn
_upstream_pkgname=matplotlib-venn
pkgver=0.11.2
pkgrel=1
pkgdesc="Functions for plotting area-proportional two- and three-way Venn diagrams in matplotlib"
arch=('any')
url="https://pypi.python.org/pypi/matplotlib-venn"
license=('MIT')
depends=('python-numpy' 'python-matplotlib' 'python-scipy')
source=(https://pypi.python.org/packages/source/m/matplotlib-venn/${_upstream_pkgname}-${pkgver}.zip)
md5sums=('35bdb397df8a2d51fe3d6ecc7df11d65')

build() {
  cd "${srcdir}/${_upstream_pkgname}-${pkgver}"
  yes | python setup.py build
}

package() {
  cd "${srcdir}/${_upstream_pkgname}-${pkgver}"
  yes | python setup.py install --root="${pkgdir}"
}
