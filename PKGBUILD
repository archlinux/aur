# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>

pkgname=python-fudge
pkgver=1.0.3
pkgrel=1
pkgdesc="Use fake objects (mocks, stubs, etc) to test real ones (Python 3)"
arch=(any)
url="http://farmdev.com/projects/fudge/"
license=(MIT)
depends=('python')
makedepends=('python-distribute')
optdepends=('python-fudge-docs: documentation for Fudge')
source=("http://pypi.python.org/packages/source/f/fudge/fudge-$pkgver.tar.gz")
md5sums=('ee0797e0a28732e630938da16137240a')

build() {
  cd "$srcdir/fudge-$pkgver"
  python setup.py install --root=$pkgdir/ --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

