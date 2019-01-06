# Maintainer: Maikel Wever <maikelwever@gmail.com>
pkgname=python-dparse
pkgver=0.4.1
pkgrel=1
pkgdesc="A parser for Python dependency files"
url="https://github.com/pyupio/dparse"
license=('MIT')
depends=('python' 'python-packaging' 'python-six' 'python-yaml')
makedepends=('python-setuptools')
source=("https://github.com/pyupio/dparse/archive/${pkgver}.tar.gz")
md5sums=('306effeb97c89a5c579c7a5b53c12e17')
arch=('any')

package() {
  cd "$srcdir/dparse-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
