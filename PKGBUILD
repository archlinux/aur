# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>

pkgname=python2-remote-pdb
_realname=remote-pdb
pkgver=2.1.0
pkgrel=1
pkgdesc="Remote vanilla PDB (over TCP sockets) done right: no extras, proper handling around connection failures and CI. Based on pdbx."
arch=(any)
url="https://github.com/ionelmc/python-remote-pdb"
license=('BSD')
makedepends=('python2-setuptools' 'python2-pbr')
depends=('python2')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/r/$_realname/$_realname-$pkgver.tar.gz")
md5sums=('952b5fe907d097cea391be100b1ad867')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
