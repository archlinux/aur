# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=python-flake8-docstrings
_pkgname=flake8-docstrings
pkgver=1.5.0
pkgrel=1
pkgdesc="A plugin to flake8 to include checks provided by pydocstyle"
arch=('any')
url="https://gitlab.com/pycqa/flake8-docstrings"
license=('MIT')
depends=('flake8' 'python-pydocstyle' 'python-flake8-polyfill')
makedepends=('python-setuptools')
source=(""https://gitlab.com/pycqa/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz"")
sha256sums=('d12872de0995ad37d715a97db1bba93875c083266985cada1e8da3d663e0d1c8')

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
