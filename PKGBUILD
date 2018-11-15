# Maintainer: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>
# Contributor: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>

pkgname=python-allure-commons
_pkgname=allure-python-commons
pkgver=2.5.3
pkgrel=1
pkgdesc='Commons of Allure python adaptors for python-based test frameworks'
arch=('any')
url="https://github.com/allure-framework/allure-python/tree/master/$_pkgname"
depends=('python' 'python-pluggy>=0.4.0' 'python-six>=1.9.0' 'python-attrs>=16.0.0')
source=("git+https://github.com/allure-framework/allure-python.git#tag=$pkgver")
md5sums=('SKIP')

package() {
  cd "$srcdir/allure-python/$_pkgname"
  python setup.py install --prefix=/usr --root="$pkgdir"
}
