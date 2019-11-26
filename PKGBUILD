# Maintainer: Michael Borders <michael.a.borders@gmail.com>

pkgname=python-ciscoconfparse
_pkgname=ciscoconfparse
pkgver=1.4.8
pkgrel=1
pkgdesc="Parse, Audit, Query, Build, and Modify Cisco IOS-style configurations "
arch=('any')
url="http://www.pennington.net/py/ciscoconfparse/"
license=('GPL')
depends=('python' 'python-colorama' 'python-passlib' 'python-dnspython')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz") #https://pypi.io/packages/source/c/ciscoconfparse/ciscoconfparse-#.#.#.tar.gz
sha256sums=('634d996b873e092893d61a5bc7cbe2580904b1f0506973dc06ec9ed355319db6')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
