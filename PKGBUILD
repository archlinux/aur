# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=pylama_pylint
pkgver=3.0.1
pkgrel=1
pkgdesc="Pylint support for pylama"
arch=('any')
url="https://github.com/klen/pylama_pylint"
license=('BSD')
depends=('pylama>=6.3.3' 'python-pylint>=1.6.4')
source=("https://github.com/klen/pylama_pylint/archive/$pkgver.tar.gz")
sha256sums=('fbe76cb219b6c45e47c9b723702d7c5a830bc41c5ae6e03f8cd69a05ae457229')

package() {
  cd "$pkgname-$pkgver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pylama_pylint/LICENSE"

  python setup.py install --root="$pkgdir/" --optimize=1
}
