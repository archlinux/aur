pkgname=python-aiodns
_pkgname=aiodns
pkgver=1.0.0
pkgrel=1
pkgdesc="An asynchronous python DNS library using asyncio"
arch=('i686' 'x86_64')
url="https://github.com/saghul/aiodns"
license=('MIT')
depends=('python' 'python-pycares')

source=("https://github.com/saghul/$_pkgname/archive/$_pkgname-${pkgver}.tar.gz")
sha512sums=('14a77a0fed53e119996402fbf90a52a678fb797085e88ef4d054768f3c9b92f3e2474bcdf910bf00a0e500f1a99ce58ab577b540707dccf513f876d9f97e9c54')

package() {
  cd "$_pkgname-$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
