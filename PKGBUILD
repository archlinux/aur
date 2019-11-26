# Maintainer: Michael Borders <michael.a.borders@gmail.com>

pkgname=python-ciscoconfparse
_pkgname=ciscoconfparse
pkgver=1.4.9
pkgrel=1
pkgdesc="Parse, Audit, Query, Build, and Modify Cisco IOS-style configurations "
arch=('any')
url="http://www.pennington.net/py/ciscoconfparse/"
license=('GPL')
depends=('python' 'python-colorama' 'python-passlib' 'python-dnspython')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz") #https://pypi.io/packages/source/c/ciscoconfparse/ciscoconfparse-#.#.#.tar.gz
sha256sums=('c0c5d497b2285650a4c69eb754eee93b3b8efc65755bb899faafd339d9f28dd7')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
