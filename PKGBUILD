# Maintainer: portaloffreedom

_pkgsrcname=humanhash3
pkgname=python-humanhash3
pkgver=0.0.6
pkgrel=1
pkgdesc="Human-readable representations of digests"
url="https://github.com/blag/humanhash"
license=("Public Domain")
arch=("any")
depends=('python')
source=("https://pypi.python.org/packages/01/06/733ffbb45b78c34eba21d72e71a67f44af6efcdfb2e31ccaa837eb5144be/$_pkgsrcname-$pkgver.tar.gz")
md5sums=('c892640cca499ba5a83cfe152d295b9d')

package() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python3 setup.py install --root $pkgdir
}


