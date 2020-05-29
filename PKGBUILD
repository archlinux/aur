# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Stunts <f.pinamartins@gmail.com>

pkgname=python-matplotlib-venn
_upstream_pkgname=matplotlib-venn
pkgver=0.11.5
pkgrel=1
pkgdesc="Functions for plotting area-proportional two- and three-way Venn diagrams in matplotlib"
arch=('any')
url="https://pypi.python.org/pypi/matplotlib-venn"
_github_url="https://github.com/konstantint/matplotlib-venn"
license=('MIT')
depends=('python-numpy' 'python-matplotlib' 'python-scipy')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/m/matplotlib-venn/${_upstream_pkgname}-${pkgver}.zip)
md5sums=('7c2f2baad242388147988f054023568e')

build() {
  cd "${srcdir}/${_upstream_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_upstream_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
