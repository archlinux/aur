# Maintainer: Nathan Owens <ndowens @ artixlinux.org>
# Maintainer: sasvari <sasvari@fastmail.com>
pkgname="python-dxfwrite"
pkgver=1.2.2
pkgrel=1
pkgdesc="A Python library to create DXF R12 drawings."
arch=(any)
url="http://dxfwrite.readthedocs.io/"
license=('MIT')
depends=("python")
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/mozman/dxfwrite.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd "$srcdir/dxfwrite"
  python setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
