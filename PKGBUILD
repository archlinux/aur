pkgname=python-pdbpp
_realname=pdbpp
pkgver=0.9.2
pkgrel=1
pkgdesc="pdb++, a drop-in replacement for pdb"
arch=(any)
url="https://github.com/antocuni/pdb"
license=('BSD')
depends=('python' 'python-fancycompleter' 'python-pygments')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/$_realname/$_realname-$pkgver.tar.gz")
md5sums=('14ecf895ae414f737713f2ead1593c53')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
