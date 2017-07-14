# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-pynput' 'python2-pynput')
pkgver=1.3.5
pkgrel=1
pkgdesc="Python library to monitor and control user input devices"
arch=('any')
url="https://github.com/moses-palmer/pynput"
license=('LGPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moses-palmer/pynput/archive/v${pkgver}.tar.gz")
sha512sums=('f9d8e56d12d8ad341b19898809e4408a25aa3e502b03c132988f6539231fe1081a7c77d2bb7cee15daa90da1202cd59f1eb484ff624dcfc85759936dd924d239')

package_python-pynput() {
    makedepends=('python-setuptools' 'python-sphinx')
    depends=('python-xlib' 'python-six')
    cd "$srcdir/pynput-${pkgver}"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}

package_python2-pynput() {
    makedepends=('python2-setuptools' 'python2-sphinx')
    depends=('python2-xlib' 'python2-six' 'python2-enum34')
    cd "$srcdir/pynput-${pkgver}"
    python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}
