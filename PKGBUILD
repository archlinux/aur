# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>

pkgname=python2-remote-pdb
_realname=remote-pdb
pkgver=0.2.1
pkgrel=1
pkgdesc="Remote vanilla PDB (over TCP sockets) done right: no extras, proper handling around connection failures and CI. Based on pdbx."
arch=(any)
url="https://github.com/ionelmc/python-remote-pdb"
license=('BSD')
depends=('python2')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/r/$_realname/$_realname-$pkgver.tar.gz")
md5sums=('96bb198a4344dcb41cf4dc214135ab73')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
