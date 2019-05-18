pkgname=("python-symfit" "python2-symfit")
pkgbase=python-symfit
pkgver=0.5.0
pkgrel=1
pkgdesc='Symbolic fitting for python - fitting as it should be'
arch=('any')
url='https://github.com/tBuLi/symfit'
makedepends=('python-setuptools' 'python2-setuptools')
license=('GPL2')
source=("https://github.com/tBuLi/symfit/archive/$pkgver.tar.gz")
md5sums=('1afffe0d7854739f0e732968ff8c2a4e')


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
