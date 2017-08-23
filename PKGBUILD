# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=pylama
pkgver=7.4.1
pkgrel=2
pkgdesc="Code audit tool for python"
arch=('any')
url="https://github.com/klen/pylama"
license=('GPL3')
depends=('python-pycodestyle>=2.0.0' 'pydocstyle>=1.1.1' 'python-pyflakes>=1.3.0' 'python-mccabe>=0.5.2')
optdepends=('pylama_pylint: pylint support')
source=("https://github.com/klen/pylama/archive/$pkgver.tar.gz")
sha256sums=('5ef870a8ee0023435bbf063134754cd20ae952968f6cff2ac200851e75f91961')

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1
}
