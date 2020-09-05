pkgname=python-ciscoconfparse
_pkgname=ciscoconfparse
pkgver=1.5.18
pkgrel=1
pkgdesc="Parse, Audit, Query, Build, and Modify Cisco IOS-style configurations "
arch=('any')
url="http://www.pennington.net/py/ciscoconfparse/"
license=('GPL3')
depends=('python' 'python-colorama' 'python-passlib' 'python-dnspython')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b95fcc3c23e8c138f826ca3e33ef8ad55c5c911712d63dd34e93a43b52542a36')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
