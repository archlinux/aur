# Maintainer: Ista Zahn <istazahn[at]gmail[dot]com>

pkgbase=python-altair
_pyname=altair
pkgname=('python-altair')
depends=('python' 'python-entrypoints' 'python-jsonschema' 'python-numpy' 'python-pandas' 'python-six' 'python-toolz')
makedepends=('python-setuptools')
optdepends=('python-selenium: png and svg export support')
pkgver=2.2.2
pkgrel=1
pkgdesc=" Declarative statistical visualization library for Python"
arch=('any')
url="https://altair-viz.github.io/"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/fa/03/18e4435c766d5db6376bd8f72a12780a9a6bc475e4904dbcc0b9acb56deb/${_pyname}-${pkgver}.tar.gz")
sha256sums=('c158699026eb5a19f95c1ca742e2e82bc20c27013ef5785f10836283e2233f8a')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"

}

# vim:set et sw=2 ts=2 tw=79:
