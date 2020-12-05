# Maintainer: Joffrey <j-off@live.fr>

pkgname='python-django-jsonfield'
pkgver=3.1.0
pkgrel=2
pkgdesc='A reusable JSONField model for Django to store ad-hoc data'
arch=('any')
url='https://github.com/dmkoch/django-jsonfield'
license=('MIT')
depends=('python-django')
makedepends=('python-setuptools')
source=("$pkgname-pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('83830542a6fcd517cb362a20239c9305a38295319b0476d79ec05b918bca1fad')

package() {
    cd "$srcdir/jsonfield-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
