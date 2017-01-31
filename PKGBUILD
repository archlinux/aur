# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=pylama
pkgver=7.3.3
pkgrel=1
pkgdesc="Code audit tool for python"
arch=('any')
url="https://github.com/klen/pylama"
license=('GPL3')
depends=('python-pycodestyle>=2.0.0' 'python-pydocstyle>=1.1.1' 'python-pyflakes>=1.3.0' 'python-mccabe>=0.5.2')
optdepends=('pylama_pylint: pylint support')
source=("https://github.com/klen/pylama/archive/$pkgver.tar.gz")
sha256sums=('cd34aeabc4acb96cfe5b0aa428023151a7538f9fa2d66688acd91818d51d912b')

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1
}
