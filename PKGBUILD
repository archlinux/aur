pkgname=python-pdbpp
_realname=pdbpp
pkgver=0.10.3
pkgrel=2
pkgdesc="pdb++, a drop-in replacement for pdb"
arch=(any)
url="https://github.com/pdbpp/pdbpp"
license=('BSD')
depends=('python' 'python-fancycompleter' 'python-pygments')
optdepends=('python-pyrepl-hg')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/$_realname/$_realname-$pkgver.tar.gz")
sha256sums=('d9e43f4fda388eeb365f2887f4e7b66ac09dce9b6236b76f63616530e2f669f5')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
