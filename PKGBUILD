# Maintainer: Joffrey <j-off@live.fr>

pkgname='python-django-post-office'
pkgver=3.3.0
pkgrel=1
pkgdesc='A simple app to send and manage your emails in Django'
arch=('any')
url='https://github.com/ui/django-post_office'
license=('MIT')
depends=('python-django-jsonfield')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1a2093d5adc2e83b8d2e1fceaaa60812f5fe36da4685ec212e7ab878cc709237')

package() {
    cd "$srcdir/django-post_office-$pkgver"
    install -Dm644 './LICENSE.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
