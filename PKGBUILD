# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=flake8-docstrings
pkgver=1.2.0
pkgrel=1
pkgdesc="A plugin to flake8 to include checks provided by pydocstyle"
arch=('any')
url="https://gitlab.com/pycqa/flake8-docstrings"
license=('MIT')
depends=('flake8' 'pydocstyle' 'python-flake8-polyfill')
makedepends=('python-setuptools')
source=("https://github.com/PyCQA/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('64973d2e4a7c6d4a59e89703a780e5f89e0d527228ceebf70e97aff748467f07')

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

