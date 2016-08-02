# Maintainer: Kevin J. Qiu <kevin@idempotent.ca>
pkgname=cdbcli
pkgver=0.2.1
pkgrel=2
pkgdesc="The interactive shell for CouchDB"
arch=('any')
url="https://github.com/kevinjqiu/cdbcli"
license=('Apache 2.0')
groups=()
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://pypi.python.org/packages/d2/9c/85cbf6be1c7d330a48847ec44b4f84794d150c493c6bb0d7270e172a40dd/cdbcli-0.2.1.tar.gz)
md5sums=('e8517838b2098205dbd2c07b313eebaa')

package() {
  curl -LO https://pypi.python.org/packages/d2/9c/85cbf6be1c7d330a48847ec44b4f84794d150c493c6bb0d7270e172a40dd/cdbcli-0.2.1.tar.gz
  tar -xzvf cdbcli-0.2.1.tar.gz
  cd "$srcdir/$pkgname-$pkgver"
  pip install -r requirements.txt
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
