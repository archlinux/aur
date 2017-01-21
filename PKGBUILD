pkgname=python-aiodns
_pkgname=aiodns
pkgver=1.1.1
pkgrel=2
pkgdesc="An asynchronous python DNS library using asyncio"
arch=('i686' 'x86_64')
url="https://github.com/saghul/aiodns"
license=('MIT')
depends=('python' 'python-pycares')

source=("https://github.com/saghul/$_pkgname/archive/$_pkgname-${pkgver}.tar.gz")
sha512sums=('1da5f50b05b1e9a7e69c13f03596b4f74f5cb7500626abace91aba84770f70bbc62336bec33cdbc2bd34b0a97a5973749d08bdc60862876819d42f6356210af6')

package() {
  cd "$_pkgname-$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
