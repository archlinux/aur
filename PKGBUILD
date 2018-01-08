# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-pynput' 'python2-pynput')
pkgver=1.3.8.1
pkgrel=1
pkgdesc="Python library to monitor and control user input devices"
arch=('any')
url="https://github.com/moses-palmer/pynput"
license=('LGPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moses-palmer/pynput/archive/v${pkgver}.tar.gz")
sha512sums=('a70001bb613ee2c9a78915ce4516c5dc319ba22f44902134815548d000760906e748761c60935e914da465329da7cf326a6388ebf5dabe7f752bd92fc64b2f1b')

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
