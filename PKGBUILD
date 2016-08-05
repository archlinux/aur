# Maintainer: Kevin J. Qiu <kevin@idempotent.ca>
pkgname=cdbcli
pkgver=0.9.1
pkgrel=1
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
source=(https://pypi.python.org/packages/ff/71/25fd3c4e152df91e2177302fb73bc5e6c85617175f206a1a179a65351d6c/cdbcli-0.9.1.tar.gz)
md5sums=('70bfc4ed013ee661eef77b0959186938')

package() {
  curl -LO https://pypi.python.org/packages/ff/71/25fd3c4e152df91e2177302fb73bc5e6c85617175f206a1a179a65351d6c/cdbcli-0.9.1.tar.gz
  tar -xzvf cdbcli-$pkgdir.tar.gz
  cd "$srcdir/$pkgname-$pkgver"
  pip install -r requirements.txt
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
