# Maintainer: Klemens Schölhorn <klemens@schoelhorn.eu>

pkgname='python-django-formtools'
pkgver=2.2
pkgrel=1
pkgdesc='A set of high-level abstractions for Django forms'
arch=('any')
url="https://github.com/jazzband/django-formtools"
license=('BSD')
depends=('python-django')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('751f91d9e1e5562169435c54ce7233f8d4e3adf560d70e1e80619130e688375b')

package() {
    cd "$srcdir/django-formtools-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
