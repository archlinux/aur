# Maintainer: Joffrey <j-off@live.fr>

pkgname='python-django-post-office'
pkgver=3.4.0
pkgrel=1
pkgdesc='A simple app to send and manage your emails in Django'
arch=('any')
url='https://github.com/ui/django-post_office'
license=('MIT')
depends=('python-django-jsonfield')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d565bdb35de82a741ca1f360a932fc86f2e0b52d6ce479547bc4ba8ca112c087')

package() {
    cd "$srcdir/django-post_office-$pkgver"
    install -Dm644 './LICENSE.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
