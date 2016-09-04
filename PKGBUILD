pkgname=python-pdbpp
_realname=pdbpp
pkgver=0.8.3
pkgrel=1
pkgdesc="pdb++, a drop-in replacement for pdb"
arch=(any)
url="http://bitbucket.org/antocuni/pdb"
license=('BSD')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/$_realname/$_realname-$pkgver.tar.gz")
md5sums=('c36d32cb9c96c52344d0d85c71afbd7e')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
