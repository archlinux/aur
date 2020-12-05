# Maintainer: Joffrey <j-off@live.fr>

pkgname=python-django-post-office
pkgver=3.5.3
pkgrel=2
pkgdesc='A simple app to send and manage your emails in Django'
arch=('any')
url='https://github.com/ui/django-post_office'
license=('MIT')
depends=('python-django-jsonfield')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d74a8b0e80f245a720a7c0344daba56ec6be03a1aaf8c45f3624405c3a4b7f4d')

package() {
    cd "$srcdir/django-post_office-$pkgver"
    install -Dm644 './LICENSE.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
