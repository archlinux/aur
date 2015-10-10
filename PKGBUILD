pkgname=python-tzwhere
pkgver=2.2
pkgrel=1
pkgdesc='Library to look up timezone from lat lng offline'
arch=('any')
url='https://github.com/pegler/pytzwhere'
license=('MIT')
depends=('python')
source=(https://pypi.python.org/packages/source/t/tzwhere/tzwhere-$pkgver.tar.gz)
sha256sums=('1f590d2c1913cffcc666bf8bb94b090c92ac8398cab14f16f20e775e61cad6ad')

package() {
  cd "$srcdir/pytzwhere-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
