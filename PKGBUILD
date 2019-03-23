pkgname=python-pdbpp
_realname=pdbpp
pkgver=0.9.14
pkgrel=1
pkgdesc="pdb++, a drop-in replacement for pdb"
arch=(any)
url="https://github.com/antocuni/pdb"
license=('BSD')
depends=('python' 'python-fancycompleter' 'python-pygments')
optdepends=('python-pyrepl-hg')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/$_realname/$_realname-$pkgver.tar.gz")
md5sums=('cf7994181e01ac6a0afc5665fb557eb1')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
