# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=python-flake8-docstrings
_pkgname=flake8-docstrings
pkgver=1.4.0
pkgrel=1
pkgdesc="A plugin to flake8 to include checks provided by pydocstyle"
arch=('any')
url="https://gitlab.com/pycqa/flake8-docstrings"
license=('MIT')
depends=('flake8' 'python-pydocstyle' 'python-flake8-polyfill')
makedepends=('python-setuptools')
source=(""https://gitlab.com/pycqa/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz"")
sha256sums=('ba81e9fdc83266b4341bd385e42f834b4b2b001dbfb9deda3fc608d65b347361')

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
