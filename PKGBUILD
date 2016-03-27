# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=pylama
pkgver=7.0.7
pkgrel=1
pkgdesc="Code audit tool for python"
arch=('any')
url="https://github.com/klen/pylama"
license=('GPL3')
depends=(pep8 pep257 python-pyflakes python-mccabe)
optdepends=('pylama_pylint: pylint support')
source=("https://github.com/klen/pylama/archive/$pkgver.tar.gz")
sha256sums=('acd961bb53047c266caf1fa160a7b3f1d865387d210ab092c80281fea4826b98')

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

