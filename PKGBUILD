# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=pylama_pylint
pkgver=2.1.1
pkgrel=1
pkgdesc="Pylint support for pylama"
arch=('any')
url="https://github.com/klen/pylama_pylint"
license=('BSD')
depends=('pylama' 'python-pylint==1.4.4')
source=("https://github.com/klen/pylama_pylint/archive/$pkgver.tar.gz")
sha256sums=('e6080ad00d3bda7cfd79b0eb6f746a4ca5bec4e1d9edb292e7d673ab4a27c1f6')

package() {
  cd "$pkgname-$pkgver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pylama_pylint/LICENSE"

  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

