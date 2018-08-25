# Maintainer: Giacomo Longo <gabibbo97@gmail.com>
pkgname=python-string-utils
pkgver=0.6.0
pkgrel=1
pkgdesc="Utility functions for strings checking and manipulation"
url="https://github.com/openshift/openshift-restclient-python"
license=('APACHE')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
arch=('any')
makedepends=('python-setuptools')
depends=('python')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
md5sums=('76ae6911f4bf0f1e76cd9be749c16745')
