pkgname=("python-django-classy-tags" "python2-django-classy-tags")
pkgbase=python-django-classy-tags
pkgver=0.8.0
pkgrel=1
pkgdesc='Class based template tags for Django'
arch=('any')
url="http://pypi.python.org/pypi/django-classy-tags/"
license=('BSD')
source=("https://pypi.python.org/packages/e0/64/a4a72d2bd04848864e7c39b30a3f44be05c328a7f7a4b6406369ad21daac/django-classy-tags-0.8.0.tar.gz")
md5sums=('ce744abd9dc3a96f87b8164bfb31a6ff')

package_python-django-classy-tags() {
    depends=('python')
    cd "$srcdir/django-classy-tags-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-classy-tags() {
    depends=('python2')
    cd "$srcdir/django-classy-tags-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
