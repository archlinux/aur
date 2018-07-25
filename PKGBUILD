# Maintainer: Ista Zahn <istazahn[at]gmail[dot]com>

pkgbase=python-altair
_pyname=altair
pkgname=('python-altair')
depends=('python' 'python-entrypoints' 'python-jsonschema' 'python-numpy' 'python-pandas' 'python-six' 'python-toolz')
makedepends=('python-setuptools')
optdepends=('python-selenium: png and svg export support')
pkgver=2.1.0
pkgrel=1
pkgdesc=" Declarative statistical visualization library for Python"
arch=('any')
url="https://altair-viz.github.io/"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/77/b2/c1134ac8eac76b76c9d398dbb9aae368faa1202353361f5760c2bb8252d3/${_pyname}-${pkgver}.tar.gz")
sha256sums=('e8b222588dde98ec614e6808357fde7fa321118db44cc909df2bf30158d931c0')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"

}

# vim:set et sw=2 ts=2 tw=79:
