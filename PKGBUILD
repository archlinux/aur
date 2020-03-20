pkgname=python-pdbpp
_realname=pdbpp
pkgver=0.10.2
pkgrel=1
pkgdesc="pdb++, a drop-in replacement for pdb"
arch=(any)
url="https://github.com/pdbpp/pdbpp"
license=('BSD')
depends=('python' 'python-fancycompleter' 'python-pygments')
optdepends=('python-pyrepl-hg')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/$_realname/$_realname-$pkgver.tar.gz")
sha256sums=('73ff220d5006e0ecdc3e2705d8328d8aa5ac27fef95cc06f6e42cd7d22d55eb8')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
