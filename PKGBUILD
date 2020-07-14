# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>

pkgname=python-remote-pdb
pkgver=2.0.0
pkgrel=1
pkgdesc="Remote vanilla PDB (over TCP sockets) done right: no extras, proper handling around connection failures and CI. Based on pdbx."
arch=(any)
url="https://github.com/ionelmc/python-remote-pdb"
license=('BSD')
depends=('python')
options=(!emptydirs)
source=("https://codeload.github.com/ionelmc/${pkgname}/zip/v${pkgver}")
md5sums=('b7cd6ca00395a12ee15b6e1d26d928d7')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
