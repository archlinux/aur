# Maintainer: Joffrey <j-off@live.fr>

pkgname='python-django-post-office'
pkgver=3.4.1
pkgrel=1
pkgdesc='A simple app to send and manage your emails in Django'
arch=('any')
url='https://github.com/ui/django-post_office'
license=('MIT')
depends=('python-django-jsonfield')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c8939802134a88d2ba80da28ecfc7e6ddae4260c85709cf86a125eb8362e07f6')

package() {
    cd "$srcdir/django-post_office-$pkgver"
    install -Dm644 './LICENSE.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
