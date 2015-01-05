pkgname=python-aiodns
_pkgname=aiodns
pkgver=0.3.1
pkgrel=1
pkgdesc="An asynchronous python DNS library using asyncio"
arch=('i686' 'x86_64')
url="https://github.com/saghul/aiodns"
license=('MIT')
depends=('python' 'python-pycares')

source=("https://github.com/saghul/$_pkgname/archive/$_pkgname-${pkgver}.tar.gz")
sha512sums=('87e021b4d6609cf694f6d856defbab2a2d485b3720e00da3b5abd9c10dd73ae5a51664f58990e01b090e51218a8b2d3207fc16f3110fc1b4460c0817544a3af3')

package() {
  cd "$_pkgname-$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
