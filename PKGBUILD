pkgname=("python-django-sekizai" "python2-django-sekizai")
pkgbase=python-django-sekizai
pkgver=0.10.0
pkgrel=1
pkgdesc='Blocks for Django'
arch=('any')
url="http://pypi.python.org/pypi/django-sekizai/"
license=('BSD')
source=("https://pypi.python.org/packages/82/ce/71e166afbe3299e98d3097b06c270ea10c28bf25b0dc846244f54303779f/django-sekizai-0.10.0.tar.gz")
md5sums=('0b9fa8d02ab35e04b32382acc47c1b6e')

package_python-django-sekizai() {
    depends=('python')
    cd "$srcdir/django-sekizai-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-sekizai() {
    depends=('python2')
    cd "$srcdir/django-sekizai-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
