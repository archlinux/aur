# Maintainer: Ista Zahn <istazahn[at]gmail[dot]com>

pkgbase=python-altair
_pyname=altair
pkgname=('python-altair')
depends=('python' 'python-entrypoints' 'python-jsonschema' 'python-numpy' 'python-pandas' 'python-six' 'python-toolz' 'python-typing')
makedepends=('python-setuptools')
pkgver=1.2.1
pkgrel=1
pkgdesc=" Declarative statistical visualization library for Python"
arch=('any')
url="https://altair-viz.github.io/"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/b8/c4/0c3f6358e88a8d716ec5ac6ed20048da5d78444586e441e4e61aaf4ca6fb/${_pyname}-${pkgver}.tar.gz")
sha256sums=('c1303f77f1ba4d632f2958c83c0f457b2b969860b1ac9adfb872aefa1780baa7')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"

}

# vim:set et sw=2 ts=2 tw=79:
