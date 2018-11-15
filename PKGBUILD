# Maintainer: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>
# Contributor: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>

pkgname=python-robotframework-allure
_pkgname=allure-robotframework
pkgver=2.5.3
pkgrel=1
pkgdesc='Allure Robot Framework Listener'
arch=('any')
url="https://github.com/allure-framework/allure-python/tree/master/$_pkgname"
depends=('robotframework' "python-allure-commons=$pkgver")
source=("git+https://github.com/allure-framework/allure-python.git#tag=$pkgver")
md5sums=('SKIP')

package() {
  cd "$srcdir/allure-python/$_pkgname"
  python setup.py install --prefix=/usr --root="$pkgdir"
}
