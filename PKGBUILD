# Maintainer: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>
# Contributor: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>

pkgname=python-pytest-allure
_pkgname=pytest-allure-adaptor
pkgver=1.7.6
pkgrel=1
pkgdesc='Plugin for py.test to generate allure xml reports'
arch=('i686' 'x86_64')
url='https://pypi.python.org/pypi/pytest-allure-adaptor'
depends=('python-pytest' 'python-lxml' 'python-six' 'python-namedlist')
source=("https://pypi.python.org/packages/79/34/7fee1e62f5d99b58f1a6b4b23f0d99caa3e1294fdfa4672c6e6ec9e25b15/${_pkgname}-$pkgver.tar.gz")
md5sums=('67d5cdb1c2ea53c227c876dec2f287ab')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}
