# Maintainer: Ista Zahn <istazahn[at]gmail[dot]com>

pkgbase=python-notedown
_pyname=notedown
pkgname=('python-notedown')
depends=('python' 'jupyter-nbformat' 'jupyter-nbconvert' 'pandoc-attributes' 'python-six')
makedepends=('python-setuptools')
pkgver=1.5.1
pkgrel=1
pkgdesc="Markdown <=> IPython Notebook"
arch=('any')
url="https://github.com/aaren/notedown"
license=('BSD')
source=("${_pyname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/58/1b/a926945216cb7d1d21abdbc975195bd7beb3bceafa41c186ecb95f8f9121/${_pyname}-${pkgver}.tar.gz")
sha256sums=('36e033ebbbe5aca0fab031ffaf3611d5bc5c50237df68ff81bb95f8be353a1ee')
package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set et sw=2 ts=2 tw=79:
