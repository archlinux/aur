# Maintainer: Joffrey <j-off@live.fr>

pkgname=python-django-post-office
pkgver=3.6.1
pkgrel=1
pkgdesc='A simple app to send and manage your emails in Django'
arch=('any')
url='https://github.com/ui/django-post_office'
license=('MIT')
depends=('python-django-jsonfield')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('db3648b2e48d98a6bb8c0c19376c4acd76002702b1524a99f29d1fddfd2c6201')

package() {
    cd "$srcdir/django-post_office-$pkgver"
    install -Dm644 './LICENSE.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
