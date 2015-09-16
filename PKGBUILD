pkgname=pywu
pkgver=1.0
pkgrel=1
pkgdesc="A simple python script for fetching data from Weather Underground's API"
arch=('any')
url="https://github.com/dh4/pywu"
license=('BSD')
depends=('python' 'python-setuptools')
source=(https://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('c044191f8d82fe351097f9ef5a1efa5d83de52d3082e23ab1f93ed94f3814c69')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
