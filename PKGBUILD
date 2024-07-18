# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Stunts <f.pinamartins@gmail.com>

pkgname=python-matplotlib-venn
_upstream_pkgname=matplotlib-venn
pkgver=0.11.10
pkgrel=1
pkgdesc="Functions for plotting area-proportional two- and three-way Venn diagrams in matplotlib"
arch=('any')
url="https://github.com/konstantint/matplotlib-venn"
_github_url="https://github.com/konstantint/matplotlib-venn"
license=('MIT')
depends=('python-numpy' 'python-matplotlib' 'python-scipy')
makedepends=('python-setuptools')
source=("https://github.com/konstantint/${_upstream_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('d64ad785ba0ef3f350d0abbe004cb70e')

build() {
  cd "${srcdir}/${_upstream_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_upstream_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
