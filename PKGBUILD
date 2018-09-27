# Maintainer: Ista Zahn <istazahn[at]gmail[dot]com>

pkgbase=python-ipystata
_pyname=ipystata
pkgname=('python-ipystata')
depends=('python' 'ipython' 'python-pandas')
makedepends=('python-setuptools')
pkgver=0.3.8
pkgrel=1
pkgdesc="Enables the use of Stata together with Python via Jupyter (IPython) notebooks"
arch=('any')
url="https://altair-viz.github.io/"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/87/77/c9bf270e716e619a487c16797d1891bedfed5a274d1f40c9efc309bc9ffd/${_pyname}-${pkgver}.tar.gz")
sha256sums=('19f4c735052c711ebf7508e177d2c05eaf84f56badbcab732bbf1f293f0b6ed2')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"

}

# vim:set et sw=2 ts=2 tw=79:
