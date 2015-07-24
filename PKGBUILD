# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=eg
pkgver=0.1.1
pkgrel=1
pkgdesc="Useful examples at the command line"
license=("MIT")
url="https://github.com/srsudar/eg"
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/srsudar/eg/archive/v${pkgver}.tar.gz")
sha256sums=('83bc25bfcbe5a9bfd136587edf4b666feeee4e22c0e48d4a27e8bcfcacd5b63e')
arch=('any')
options=(!emptydirs)

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir
}

