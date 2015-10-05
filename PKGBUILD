pkgname=pywu
pkgver=1.1
pkgrel=2
pkgdesc="A simple python script for fetching data from Weather Underground's API"
arch=('any')
url="https://github.com/dh4/pywu"
license=('BSD')
depends=('python' 'python-setuptools')
source=(https://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('77ac377bf9b0367c580d08f6eeb631af1e8ceba2b7e9ef64cccf80bd9262394a')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
