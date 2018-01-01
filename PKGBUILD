pkgname=("python-symfit" "python2-symfit")
pkgbase=python-symfit
pkgver=0.4.0
pkgrel=1
pkgdesc='Symbolic fitting for python - fitting as it should be'
arch=('any')
url='https://github.com/tBuLi/symfit'
makedepends=('python-setuptools' 'python2-setuptools')
license=('GPL2')
source=("https://github.com/tBuLi/symfit/archive/$pkgver.tar.gz")
md5sums=('c06e1799b05301aa4eac4d5458b98005')


package_python-symfit() {
    depends=('python' 'python-numpy' 'python-sympy')
    cd "$srcdir/symfit-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-symfit() {
    depends=('python2' 'python2-numpy' 'python2-sympy')
    cd "$srcdir/symfit-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
