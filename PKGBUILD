# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=pylama_pylint
pkgver=2.2.1
pkgrel=1
pkgdesc="Pylint support for pylama"
arch=('any')
url="https://github.com/klen/pylama_pylint"
license=('BSD')
depends=('pylama>=6.3.3' 'python-pylint>=1.5.4')
source=("https://github.com/klen/pylama_pylint/archive/$pkgver.tar.gz")
sha256sums=('6a2fe8ec97eed86e02a43ffcde1968d091159553076941c167920307c2aba7aa')

package() {
  cd "$pkgname-$pkgver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pylama_pylint/LICENSE"

  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

