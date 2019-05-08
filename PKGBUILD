# Maintainer: Joffrey <j-off@live.fr>

pkgname=('python-django-post-office' 'python2-django-post-office')
pkgbase='python-django-post-office'
pkgver='3.2.0'
pkgrel=1
pkgdesc='A simple app to send and manage your emails in Django'
arch=('any')
url='https://github.com/ui/django-post_office'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ac8a9dfe2090de0bf6450d50060134cc8a671030aedbbdacf123e7ae39be5923')

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
