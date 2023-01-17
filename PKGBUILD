# Maintainer: Vekhir <vekhir AT yahoo DOT com>

pkgname='python-pyffms2'
pkgver=0.4.5.5
pkgrel=1
pkgdesc='pyffms2 – Python bindings for FFMS2'
arch=('x86_64')
url='https://github.com/bubblesub/pyffms2/'
license=('GPLv3')
depends=('ffms2')
makedepends=('git' 'python-setuptools')
source=("pyffms2-${pkgver}.tar.gz::https://github.com/bubblesub/pyffms2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bc06b2f0460a05e542f7612d05a10b9954ac99c392674f94adbb89e2bcdb3571')

build() {
  cd pyffms2-${pkgver}/
  python setup.py build
}

package() {
  cd pyffms2-${pkgver}/
  python setup.py install --root="$pkgdir" --optimize=1
}
