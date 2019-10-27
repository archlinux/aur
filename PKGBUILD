pkgname=python-aiodns
_pkgname=aiodns
pkgver=2.0.0
pkgrel=2
pkgdesc="An asynchronous python DNS library using asyncio"
arch=('i686' 'x86_64')
url="https://github.com/saghul/aiodns"
license=('MIT')
depends=('python' 'python-pycares' 'python-setuptools')
source=("https://github.com/saghul/$_pkgname/archive/$_pkgname-${pkgver}.tar.gz")
sha512sums=('571c216edf24ad00b326f036b9ca39ab52d1bebd542c677bf9fb1978370be67bbdaeedc19228a8f4a20645fddbd18bd0e37f0404fec61d14fbf7638037b2c32b')

package() {
  cd "$_pkgname-$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
