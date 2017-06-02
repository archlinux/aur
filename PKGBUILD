# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=flake8-docstrings
pkgver=1.1.0
pkgrel=2
pkgdesc="A plugin to flake8 to include checks provided by pydocstyle"
arch=('any')
url="https://gitlab.com/pycqa/flake8-docstrings"
license=('MIT')
depends=('flake8' 'pydocstyle' 'python-flake8-polyfill')
makedepends=('python-setuptools')
source=("https://github.com/PyCQA/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('37747c85be3b7b5d09a858b513e4f366c1a709c4114661bb2b3af558ac708f7c')

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

