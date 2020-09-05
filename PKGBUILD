pkgname=python-ciscoconfparse
_pkgname=ciscoconfparse
pkgver=1.5.3
pkgrel=1
pkgdesc="Parse, Audit, Query, Build, and Modify Cisco IOS-style configurations "
arch=('any')
url="http://www.pennington.net/py/ciscoconfparse/"
license=('GPL3')
depends=('python' 'python-colorama' 'python-passlib' 'python-dnspython')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ca9c63cef1e518f6ab225713df7ead25962766981ceaa03e4b5ccf7c2bb3d7a8')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
