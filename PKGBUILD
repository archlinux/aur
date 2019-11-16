# Maintainer: Michael Borders <michael.a.borders@gmail.com>

pkgname=python-ciscoconfparse
_pkgname=ciscoconfparse
pkgver=1.4.7
pkgrel=1
pkgdesc="Parse, Audit, Query, Build, and Modify Cisco IOS-style configurations "
arch=('any')
url="https://github.com/napalm-automation/napalm"
license=('GPL')
depends=('python' 'python-colorama' 'python-passlib' 'python-dnspython')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('dbebc9f87f07641015e1d1a294cf550c5a376060e9113586eb43f37884e7f230')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
