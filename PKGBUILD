pkgname=("python-django-formtools" "python2-django-formtools")
pkgbase=python-django-formtools
pkgver=2.0
pkgrel=1
pkgdesc='A set of high-level abstractions for Django forms'
arch=('any')
url="http://pypi.python.org/pypi/django-formtools/"
license=('BSD')
source=("https://pypi.python.org/packages/a8/07/947dfe63dff1f2be5f84eb7f0ff5f712bb1dc730a6499b0aa0be5c8f194e/django-formtools-2.0.tar.gz")
md5sums=('7692429605d20cf553aacb505026ff86')

package_python-django-formtools() {
    depends=('python')
    cd "$srcdir/django-formtools-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-formtools() {
    depends=('python2')
    cd "$srcdir/django-formtools-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
