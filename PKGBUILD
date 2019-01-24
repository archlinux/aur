# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>
# Contributor: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=pylama_pylint
pkgver=3.1.2
pkgrel=1
pkgdesc="Pylint support for pylama"
arch=('any')
url="https://github.com/klen/pylama_pylint"
license=('BSD')
depends=('pylama>=6.3.3' 'python-pylint>=1.6.4')
source=("https://github.com/klen/pylama_pylint/archive/$pkgver.tar.gz")
sha256sums=('5e11b21112f01e1c6feb505c493abbf6ba0d8c199234e88c21aa5267d1c3b23b')

package() {
  cd "$pkgname-$pkgver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pylama_pylint/LICENSE"

  python setup.py install --root="$pkgdir/" --optimize=1
}
