# Maintainer: Joffrey <j-off@live.fr>

pkgbase='python-django-statici18n'
pkgname=('python-django-statici18n' 'python2-django-statici18n')
pkgver='1.8.2'
pkgrel=1
pkgdesc='A Django app that provides helper for generating JavaScript catalog to static files'
arch=('any')
url='https://github.com/zyegfryed/django-statici18n'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/zyegfryed/django-statici18n/archive/$pkgver.tar.gz")
sha256sums=('4afe500dbdef989d32bc9d4cd7722fbdf5c4cfb81da58d5a338e2c50934300e8')

package_python-django-statici18n() {
    depends=(
        'python-django'
        'python-django-appconf'
    )
    cd "$srcdir/django-statici18n-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}

package_python2-django-statici18n() {
    depends=(
        'python2-django'
        'python2-django-appconf'
    )
    cd "$srcdir/django-statici18n-$pkgver"
    install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python2 './setup.py' install --root="$pkgdir" --optimize=1
}
