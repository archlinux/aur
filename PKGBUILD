# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=pylama
pkgver=7.0.6
pkgrel=1
pkgdesc="Code audit tool for python"
arch=('any')
url="https://github.com/klen/pylama"
license=('GPL3')
depends=(pep8 pep257 python-pyflakes python-mccabe)
optdepends=('pylama_pylint: pylint support')
source=("https://github.com/klen/pylama/archive/$pkgver.tar.gz")
sha256sums=('4db9183491a3fa6080361a06a0c74645c988f65745cf4b7b9951d2783c88479c')

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

