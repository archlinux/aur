# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=eg
pkgver=0.1.0
pkgrel=1
_gitver=a807b5a2e09d05c9a68ed6b32cd22b5c321e2852
pkgdesc="Useful examples at the command line"
license=("MIT")
url="https://github.com/srsudar/eg"
depends=('python')
makedepends=('python-setuptools')
# source=("${pkgname}-${pkgver}.tar.gz::https://github.com/srsudar/eg/archive/v${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/srsudar/eg/archive/${_gitver}.tar.gz")
arch=('any')
options=(!emptydirs)

package() {
  #cd $srcdir/$pkgname-$pkgver
  cd $srcdir/$pkgname-$_gitver

  #find . -type f -exec sed -i \
  #  -e'1s|^#!/usr/bin/env python$|#!/usr/bin/env python2|' \
  #  -e '1s|^#!/usr/bin/python$|#!/usr/bin/env python2|' \
  #  "{}" \;

  #python2 setup.py install --root=$pkgdir
  python setup.py install --root=$pkgdir
}

sha256sums=('d7455adc71b1f7ccce6880bfc564537c240cc14ace801d2380379ec556d52e75')
