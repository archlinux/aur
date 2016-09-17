pkgname=python-tzwhere
pkgver=2.3
pkgrel=1
pkgdesc='Library to look up timezone from lat lng offline'
arch=('any')
url='https://github.com/pegler/pytzwhere'
license=('MIT')
depends=('python')
source=(https://pypi.python.org/packages/1c/60/eaeeb9ab5622e2b5655c9636c11d28979277aacfec8ed1885a43b93ffe12/tzwhere-2.3.tar.gz)
sha256sums=('77fc41912556f745dfc761144a27cb00795f5a2fee5f10eb6530b19211914bed')

package() {
  cd "$srcdir/tzwhere-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
