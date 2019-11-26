# Maintainer: Michael Borders <michael.a.borders@gmail.com>

pkgname=python-parmed
_pkgname=ParmEd
pkgver=3.2.0
pkgrel=2
pkgdesc="Amber parameter file editor"
arch=('any')
url="https://github.com/parmed/parmed"
license=('LGPL2.1')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('5522cb6218b467a7b9f5c8dd5f81a59d199f8712b8d02a1ad6c9161647256821')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 GNU_LGPL_v2 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
