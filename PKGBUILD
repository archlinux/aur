# Maintainer: Ista Zahn <istazahn[at]gmail[dot]com>

pkgbase=python-altair
_pyname=altair
pkgname=('python-altair')
depends=('python' 'python-entrypoints' 'python-jsonschema' 'python-numpy' 'python-pandas' 'python-six' 'python-toolz')
makedepends=('python-setuptools')
optdepends=('python-selenium: png and svg export support')
pkgver=2.0.1
pkgrel=3
pkgdesc=" Declarative statistical visualization library for Python"
arch=('any')
url="https://altair-viz.github.io/"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/19/1f/55b9d398b3217bb9feb8405188b38f13320ece65f383cf769e38ac4a81ba/${_pyname}-${pkgver}.tar.gz")
sha256sums=('a5ec9878cbfd7e934bc95becb6a50edbbabb93614e7c59ff199b66db856c676e')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"

}

# vim:set et sw=2 ts=2 tw=79:
