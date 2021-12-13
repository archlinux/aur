# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-pysmt
_pkgname=PySMT
pkgver=0.9.1.dev139
pkgrel=1
pkgdesc="A solver-agnostic library for SMT Formulae manipulation and solving"
arch=('any')
url="http://www.pysmt.org"
license=('Apache')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py2.py3/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver-py2.py3-none-any.whl")
sha256sums=('4ec51e21bf24b4d1aae83bf0ef941c93d7d315730f016930d5adfa3eac8c2d33')

package () {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
