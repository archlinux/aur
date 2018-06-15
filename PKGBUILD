# Maintainer: Joffrey <j-off@live.fr>

pkgname=('python-django-post-office' 'python2-django-post-office')
pkgbase='python-django-post-office'
pkgver='3.0.4'
pkgrel=1
pkgdesc='A simple app to send and manage your emails in Django'
arch=('any')
url='https://github.com/ui/django-post_office'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/ui/django-post_office/archive/v$pkgver.tar.gz")
sha256sums=('4faf61df6a087f95e34fe31efe9571729286e83edf556f300c9198852fd92593')

package_python-django-post-office() {
    depends=('python-django-jsonfield')
    cd "$srcdir/django-post_office-$pkgver"
    install -Dm644 './LICENSE.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}

package_python2-django-post-office() {
    depends=('python2-django-jsonfield')
    cd "$srcdir/django-post_office-$pkgver"
    install -Dm644 './LICENSE.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python2 './setup.py' install --root="$pkgdir" --optimize=1
}
