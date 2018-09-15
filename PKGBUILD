# Maintainer: Joffrey <j-off@live.fr>

pkgname=('python-django-post-office' 'python2-django-post-office')
pkgbase='python-django-post-office'
pkgver='3.1.0'
pkgrel=1
pkgdesc='A simple app to send and manage your emails in Django'
arch=('any')
url='https://github.com/ui/django-post_office'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/ui/django-post_office/archive/v$pkgver.tar.gz")
sha256sums=('b9650576e4dbf7af164a75031967af15e8e14a189052d8b44c1b3c03d9e9814b')

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
